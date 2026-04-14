import fs from 'node:fs';
import path from 'node:path';

export interface AntiPattern {
  name: string;
  description: string;
  severity: 'Critical' | 'High' | 'Medium' | 'Low';
  category: string;
  categorySlug: string;
}

export interface PatternCategory {
  name: string;
  slug: string;
  description: string;
  patterns: AntiPattern[];
}

function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '');
}

export function loadPatterns(): PatternCategory[] {
  const filePath = path.resolve(process.cwd(), '..', 'skills', 'intent', 'SKILL.md');
  const content = fs.readFileSync(filePath, 'utf-8');

  const categories: PatternCategory[] = [];
  let currentCategory: PatternCategory | null = null;

  const lines = content.split('\n');

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

    // Match category headers: ### Category N: Name
    const catMatch = line.match(/^### Category \d+:\s*(.+)/);
    if (catMatch) {
      const name = catMatch[1].trim();
      // Next line is the description
      const desc = (lines[i + 1] || '').trim();
      currentCategory = {
        name,
        slug: slugify(name),
        description: desc,
        patterns: [],
      };
      categories.push(currentCategory);
      continue;
    }

    // Match table rows: | **Name** | Description | Severity |
    if (currentCategory && line.startsWith('| **')) {
      const cells = line.split('|').map(c => c.trim()).filter(Boolean);
      if (cells.length >= 3) {
        const nameMatch = cells[0].match(/\*\*(.+?)\*\*/);
        const name = nameMatch ? nameMatch[1] : cells[0];
        const description = cells[1];
        const severity = cells[2] as AntiPattern['severity'];

        currentCategory.patterns.push({
          name,
          description,
          severity,
          category: currentCategory.name,
          categorySlug: currentCategory.slug,
        });
      }
    }
  }

  return categories;
}

export function allPatterns(categories: PatternCategory[]): AntiPattern[] {
  return categories.flatMap(c => c.patterns);
}

export function patternStats(categories: PatternCategory[]): { total: number; categories: number } {
  return {
    total: categories.reduce((sum, c) => sum + c.patterns.length, 0),
    categories: categories.length,
  };
}
