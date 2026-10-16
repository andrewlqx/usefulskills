# Claude Skills

My personal library of Claude skills. Each skill is a folder under `skills/` containing a `SKILL.md`.

| Skill | What it does |
|---|---|
| [prd-writer](skills/prd-writer/SKILL.md) | Drafts lean 1–2 page PRDs (sanitised, generic example), guides the user with intake questions, and outputs Confluence-ready copy |

## Use a skill

**Claude app (Cowork / claude.ai):** run `./package.sh`, then upload `dist/<skill>.zip` under **Settings → Capabilities → Skills**.

**Claude Code (all projects):** copy or symlink the folder into `~/.claude/skills/`:

```bash
ln -s "$(pwd)/skills/prd-writer" ~/.claude/skills/prd-writer
```

**Claude Code (one project):** copy the folder into that repo's `.claude/skills/`.

## Add or update a skill

1. Create or edit `skills/<skill-name>/SKILL.md` (frontmatter `name` and `description`, then instructions).
2. Run `./package.sh` to rebuild the zips in `dist/`.
3. Commit, push, and re-upload the zip in the Claude app if it changed.
