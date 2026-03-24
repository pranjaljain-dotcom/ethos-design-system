# Ethos Design System — Claude Context Framework

Central repository for Claude AI context across all Ethos products. Defines the design system, component patterns, and per-product context so Claude always works with the right rules when you open any product project.

---

## Structure

```
ethos-design-system/
├── CLAUDE.md                        ← Master design system rules (imported by all products)
├── tokens/
│   ├── colors.md                    ← Color palette + token reference
│   ├── typography.md                ← Theinhardt type scale
│   └── spacing.md                   ← 8px grid system
├── components/
│   ├── buttons.md                   ← Primary CTA, back btn, amount pills
│   ├── forms.md                     ← Inputs, selects, option tiles
│   └── navigation.md                ← Top bar, progress bar, step counter, HIW stepper
├── motion.md                        ← Animation rules + keyframes
├── product-contexts/
│   ├── annuities-interview/
│   │   ├── CLAUDE.md                ← Product PRD + tech architecture
│   │   └── .claude/commands/
│   │       ├── new-step.md          ← /new-step slash command
│   │       └── add-transition.md    ← /add-transition slash command
│   └── modal-preview/
│       ├── CLAUDE.md                ← Product PRD + screen inventory
│       └── .claude/commands/
│           └── new-screen.md        ← /new-screen slash command
└── scripts/
    └── install.sh                   ← Installs product context into project folder
```

---

## How It Works

### Layer 1 — Design System (shared)
`ethos-design-system/CLAUDE.md` contains all visual/component rules: tokens, components, motion, layout, and coding standards. This file is **imported** into every product's CLAUDE.md via the `@path` directive.

### Layer 2 — Product Context (per product)
`product-contexts/{product}/CLAUDE.md` contains:
- `@../../CLAUDE.md` — imports the design system
- Product overview + live URLs
- PRD summary (goals, user journey, outcomes)
- Technical architecture (SPA pattern, state, file map)
- Screen/step inventory
- Known constraints and gotchas

### Layer 3 — Product Skills (per product)
`product-contexts/{product}/.claude/commands/*.md` are slash commands available only when working in that product. These encode repeatable tasks so Claude executes them consistently.

---

## Installing Into a Product

### Option 1 — Install script (recommended)
```bash
cd /Users/pranjal.jain/ethos-design-system
chmod +x scripts/install.sh

# Install one product
./scripts/install.sh annuities-interview

# Install all products
./scripts/install.sh all
```

### Option 2 — Manual copy
1. Copy `product-contexts/{product}/CLAUDE.md` → `{product}/CLAUDE.md`
2. Copy `product-contexts/{product}/.claude/` → `{product}/.claude/`

---

## Adding a New Product

1. Create `product-contexts/{new-product}/CLAUDE.md` — start with:
```markdown
@../../CLAUDE.md

# {Product Name} — Product Context
...
```
2. Add product slash commands in `product-contexts/{new-product}/.claude/commands/`
3. Run `./scripts/install.sh {new-product}` to deploy into the project

---

## Products

| Product | Project Path | Context File | Live URL |
|---------|-------------|--------------|----------|
| Annuities Interview | `/Users/pranjal.jain/annuities-interview/` | `product-contexts/annuities-interview/CLAUDE.md` | https://pranjaljain-dotcom.github.io/annuities-interview/ |
| Policy Owner (AAA) | `/Users/pranjal.jain/modal-preview/` | `product-contexts/modal-preview/CLAUDE.md` | https://pranjaljain-dotcom.github.io/modal-preview/ |

---

## Updating the Design System

Edit `CLAUDE.md` (or the relevant `tokens/`, `components/`, `motion.md` file). Changes propagate to all products automatically on next Claude session — no re-install needed, since products `@import` the file by path.
