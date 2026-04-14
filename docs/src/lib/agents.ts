import fs from 'node:fs';
import path from 'node:path';

export interface Agent {
  slug: string;
  name: string;
  tagline: string;
  domain: string;
  skills: string[];
  description: string;
}

const AGENT_META: Record<string, { domain: string; skills: string[] }> = {
  noor: {
    domain: 'Foundation & Context',
    skills: ['intent'],
  },
  ember: {
    domain: 'Strategy & Research',
    skills: ['strategize', 'investigate'],
  },
  wren: {
    domain: 'Experience Design',
    skills: ['journey', 'organize', 'articulate'],
  },
  vigil: {
    domain: 'Quality & Inclusion',
    skills: ['evaluate', 'fortify', 'include'],
  },
  rune: {
    domain: 'Adaptation & Measurement',
    skills: ['transpose', 'localize', 'measure'],
  },
  sage: {
    domain: 'Cross-cutting Wisdom',
    skills: ['philosopher', 'blueprint', 'specify'],
  },
};

export function loadAgents(): Agent[] {
  const agentsDir = path.resolve(process.cwd(), '..', 'agents');
  const files = fs.readdirSync(agentsDir).filter((f: string) => f.endsWith('.md') && f !== 'HOW-TO-USE.md');

  const agents: Agent[] = [];

  for (const file of files) {
    const slug = file.replace('.md', '');
    const meta = AGENT_META[slug];
    if (!meta) continue;

    const content = fs.readFileSync(path.join(agentsDir, file), 'utf-8');

    // Extract name and tagline from first heading: # Name — Tagline
    const headingMatch = content.match(/^# (.+?) — (.+)$/m);
    const name = headingMatch ? headingMatch[1] : slug;
    const tagline = headingMatch ? headingMatch[2] : '';

    // Extract first paragraph after heading as description
    const lines = content.split('\n');
    let desc = '';
    let foundHeading = false;
    for (const line of lines) {
      if (line.startsWith('# ')) { foundHeading = true; continue; }
      if (foundHeading && line.trim() && !line.startsWith('#')) {
        desc = line.trim();
        break;
      }
    }

    agents.push({
      slug,
      name,
      tagline,
      domain: meta.domain,
      skills: meta.skills,
      description: desc,
    });
  }

  // Maintain order: noor, ember, wren, vigil, rune, sage
  const order = ['noor', 'ember', 'wren', 'vigil', 'rune', 'sage'];
  agents.sort((a, b) => order.indexOf(a.slug) - order.indexOf(b.slug));

  return agents;
}
