# Ethos Design System

Shared visual design rules for all Ethos products. This repo is the single source of truth for tokens, component patterns, and motion — imported by every product's Claude context via `@path`.

## Structure

```
ethos-design-system/
├── CLAUDE.md          ← Master rules file — import this into any product
├── tokens/
│   ├── colors.md      ← Full color palette + token reference
│   ├── typography.md  ← Theinhardt type scale + weights
│   └── spacing.md     ← 8px grid system
├── components/
│   ├── buttons.md     ← Primary CTA, back button, amount pills
│   ├── forms.md       ← Inputs, selects, option tiles
│   └── navigation.md  ← Top bar, progress bar, step counter, HIW stepper
└── motion.md          ← Animation rules + keyframes
```

## How to Use

In any product's `CLAUDE.md`, add this as the first line:

```
@../ethos-design-system/CLAUDE.md
```

Claude will load the full DS ruleset before any product-specific context.

## Updating

Edit `CLAUDE.md` or the relevant sub-file. All products pick up changes automatically on next Claude session — no reinstall needed.

## Product Contexts

Product-specific PRDs, architecture docs, and slash commands live in a separate repo:
→ `github.com/pranjaljain-dotcom/ethos-product-context`
