import fs from 'node:fs';
import path from 'node:path';

export interface Skill {
  slug: string;
  name: string;
  description: string;
  overview: string;
  triggers: string;
  category: string;
}

const CATEGORIES: Record<string, { label: string; order: number }> = {
  intent:      { label: 'Foundation',              order: 0 },
  strategize:  { label: 'Strategy & Research',     order: 1 },
  investigate: { label: 'Strategy & Research',     order: 1 },
  blueprint:   { label: 'Strategy & Research',     order: 1 },
  journey:     { label: 'Experience Design',       order: 2 },
  organize:    { label: 'Experience Design',       order: 2 },
  articulate:  { label: 'Experience Design',       order: 2 },
  evaluate:    { label: 'Quality & Evaluation',    order: 3 },
  fortify:     { label: 'Quality & Evaluation',    order: 3 },
  include:     { label: 'Quality & Evaluation',    order: 3 },
  transpose:   { label: 'Adaptation & Context',    order: 4 },
  localize:    { label: 'Adaptation & Context',    order: 4 },
  measure:     { label: 'Measurement',             order: 5 },
  philosopher: { label: 'Cross-cutting',           order: 6 },
  specify:     { label: 'Handoff',                 order: 7 },
};

function parseFrontmatter(content: string): { data: Record<string, string>; body: string } {
  const match = content.match(/^---\n([\s\S]*?)\n---\n([\s\S]*)$/);
  if (!match) return { data: {}, body: content };

  const data: Record<string, string> = {};
  let currentKey = '';
  let currentValue = '';

  for (const line of match[1].split('\n')) {
    const kvMatch = line.match(/^(\w[\w-]*):\s*(.*)$/);
    if (kvMatch) {
      if (currentKey) data[currentKey] = currentValue.trim();
      currentKey = kvMatch[1];
      currentValue = kvMatch[2].replace(/^>\s*$/, '');
    } else if (currentKey) {
      currentValue += ' ' + line.trim();
    }
  }
  if (currentKey) data[currentKey] = currentValue.trim();

  return { data, body: match[2] };
}

function extractSection(body: string, heading: string): string {
  const pattern = new RegExp(`^##\\s+${heading}[\\s\\S]*?\\n\\n([\\s\\S]*?)(?=\\n##\\s|$)`, 'm');
  const match = body.match(pattern);
  if (!match) return '';
  // Take first 2-3 sentences
  const text = match[1].trim();
  const sentences = text.split(/(?<=[.!?])\s+/);
  return sentences.slice(0, 3).join(' ');
}

function extractTriggers(body: string): string {
  const pattern = /\*\*When to activate[^*]*\*\*\s*(.*?)(?:\n\n|$)/s;
  const match = body.match(pattern);
  return match ? match[1].trim() : '';
}

export function loadSkills(): Skill[] {
  const skillsDir = path.resolve(process.cwd(), '..', 'skills');
  const dirs = fs.readdirSync(skillsDir).filter((d: string) => {
    return fs.statSync(path.join(skillsDir, d)).isDirectory();
  });

  const skills: Skill[] = [];

  for (const dir of dirs) {
    const filePath = path.join(skillsDir, dir, 'SKILL.md');
    if (!fs.existsSync(filePath)) continue;

    const content = fs.readFileSync(filePath, 'utf-8');
    const { data, body } = parseFrontmatter(content);

    const slug = dir;
    const cat = CATEGORIES[slug];
    if (!cat) continue;

    skills.push({
      slug,
      name: data.name || slug,
      description: data.description || '',
      overview: extractSection(body, 'Overview'),
      triggers: extractTriggers(body),
      category: cat.label,
    });
  }

  // Sort by category order, then alphabetically within category
  skills.sort((a, b) => {
    const aOrder = CATEGORIES[a.slug]?.order ?? 99;
    const bOrder = CATEGORIES[b.slug]?.order ?? 99;
    if (aOrder !== bOrder) return aOrder - bOrder;
    return a.slug.localeCompare(b.slug);
  });

  return skills;
}

export interface SkillCategory {
  label: string;
  skills: Skill[];
}

export function groupByCategory(skills: Skill[]): SkillCategory[] {
  const groups: Map<string, Skill[]> = new Map();
  for (const skill of skills) {
    if (!groups.has(skill.category)) groups.set(skill.category, []);
    groups.get(skill.category)!.push(skill);
  }
  return Array.from(groups.entries()).map(([label, skills]) => ({ label, skills }));
}
