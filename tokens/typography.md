# Typography Tokens

## Font Family
**Primary:** Theinhardt (custom, self-hosted)
**Fallback stack:** `-apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif`

## Weights
| Weight | Name | File |
|--------|------|------|
| 300 | Light | `Theinhardt-Light.otf` |
| 400 | Regular | `Theinhardt-Regular.otf` |
| 500 | Medium | `Theinhardt-Medium.otf` |
| 700 | Bold | `Theinhardt-Bold.otf` |

## Scale
| Role | Class | Size | Weight | Line Height | Letter Spacing |
|------|-------|------|--------|-------------|----------------|
| Page heading | `.q-heading` | 28px | 500 | 40px | -0.28px |
| Section heading | — | 22px | 500 | 32px | -0.22px |
| Body / description | `.q-desc` | 16px | 400 | 24px | 0 |
| Option label | `.option-card-text` | 16px | 500 | 24px | 0 |
| Option sub-label | `.option-card-sub` | 13px | 400 | 18px | 0 |
| Step counter | `.step-counter` | 13px | 500 | 18px | 0.04em |
| Button | `.btn-continue` | 16px | 500 | 24px | 0 |
| Field label | `.field-label` | 13px | 500 | 18px | 0 |

## Rules
- Step counters are UPPERCASE via `text-transform: uppercase`
- Heading letter spacing is always negative (tight)
- Never go below `12px` for any visible text
- Body copy colour: `#272727` (primary) or `#7e7e7e` (muted) — no other text colours
