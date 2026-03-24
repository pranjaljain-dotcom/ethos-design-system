# Ethos Design System — Claude Context

You are working within the Ethos product design system. Apply every rule below to all UI work across all Ethos products unless a product-level CLAUDE.md explicitly overrides a specific rule.

---

## Brand Identity
- **Company:** Ethos Life
- **Mission:** Make life insurance and financial products simple, transparent, and trustworthy
- **Tone:** Warm, clear, confident — never clinical, never jargon-heavy
- **Audience:** Adults 25–65 making significant financial decisions. Assume moderate financial literacy.

---

## Color Tokens

| Token | Value | Usage |
|-------|-------|-------|
| `--color-primary` | `#056257` | CTAs, active states, progress fills, focus rings |
| `--color-primary-light` | `#f5fffe` | Modal backgrounds, selected tile tint, input focus bg |
| `--color-text-primary` | `#272727` | All headings and body copy |
| `--color-text-muted` | `#7e7e7e` | Descriptions, labels, placeholders, step counters |
| `--color-text-inverse` | `#ffffff` | Text on primary-coloured backgrounds |
| `--color-border` | `#d4d4d4` | Input borders, dividers, unselected tiles, progress track |
| `--color-surface` | `#ffffff` | Page and card backgrounds |
| `--color-overlay` | `rgba(0,0,0,0.5)` | Modal backdrops with `backdrop-filter:blur(10px)` |
| `--color-success` | `#056257` | Checkmarks, completed states (same as primary) |
| `--color-error` | `#d93025` | Validation errors |

---

## Typography — Theinhardt

**Font stack:** `'Theinhardt', -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif`

**Weights loaded:** 300 (Light), 400 (Regular), 500 (Medium), 700 (Bold)

| Role | Size | Weight | Line Height | Letter Spacing |
|------|------|--------|-------------|----------------|
| Page heading (`q-heading`) | 28px | 500 | 40px | -0.28px |
| Section heading | 22px | 500 | 32px | -0.22px |
| Body / description (`q-desc`) | 16px | 400 | 24px | 0 |
| Option tile label | 16px | 500 | 24px | 0 |
| Option tile sub-label | 13px | 400 | 18px | 0 |
| Step counter / badge | 13px | 500 | 18px | 0.04em (uppercase) |
| Button | 16px | 500 | 24px | 0 |
| Field label | 13px | 500 | 18px | 0 |
| Small / caption | 12px | 400 | 16px | 0 |

---

## Spacing — 8px Grid

| Token | Value | Common use |
|-------|-------|------------|
| `--space-xs` | 4px | Icon gap, tight padding |
| `--space-sm` | 8px | Between related elements |
| `--space-md` | 16px | Card inner padding, field gap |
| `--space-lg` | 24px | Between sections, stack gap |
| `--space-xl` | 32px | Section separation |
| `--space-2xl` | 40px | Progress bar bottom margin |
| `--space-3xl` | 64px | Modal padding |

---

## Border Radius

| Element | Radius |
|---------|--------|
| Cards / Modals | `12px` |
| Buttons (pill) | `32px` |
| Input fields | `8px` |
| Option tiles | `8px` |
| Progress bar | `4px` |
| Badges / chips | `100px` |
| Amount pills | `100px` |

---

## Component Patterns

### Primary Button `.btn-continue`
```css
background: #056257;
color: #fff;
border: none;
border-radius: 32px;
padding: 14px 32px;
font-size: 16px;
font-weight: 500;
font-family: inherit;
width: 100%;
cursor: pointer;
transition: background 0.2s;
margin-top: 8px;
```
- Hover: `background: #044d44`
- Disabled (`.btn-disabled`): `background: #d4d4d4; cursor: not-allowed`
- **Never use `opacity` for disabled state — always swap the background colour**

### Option Tile `.option-card`
Used for both single-select (radio) and multi-select (checkbox) choices.
```css
border: 1.5px solid #d4d4d4;
border-radius: 8px;
padding: 14px 16px;
display: flex;
align-items: center;
gap: 12px;
cursor: pointer;
transition: border-color 0.15s, background 0.15s;
```
- Selected: `border-color: #056257; background: #f5fffe`
- Icon box: `28×28px`, stroke icon `#7e7e7e` → `#056257` on selection
- Sub-label (`.option-card-sub`): `font-size:13px; color:#7e7e7e; margin-top:2px`

### Progress Bar `.progress-track / .progress-fill`
```css
/* track */
height: 8px; background: #d4d4d4; border-radius: 4px; overflow: hidden;
/* fill */
height: 100%; background: #056257; border-radius: 4px;
transition: width 0.55s cubic-bezier(0.4, 0, 0.2, 1);
```

### Custom Select `.custom-select`
- Trigger height: `52px`, border `1.5px solid #d4d4d4`, radius `8px`
- Chevron rotates `180deg` on open, `transition: transform 0.2s ease`
- Dropdown: `border 1.5px solid #d4d4d4; border-top: none; border-radius: 0 0 8px 8px; max-height: 240px; overflow-y: auto`
- Selected option highlight: `background: #f5fffe; color: #056257`

### Text Input `.text-input`
```css
width: 100%;
border: 1.5px solid #d4d4d4;
border-radius: 8px;
padding: 14px 16px;
font-size: 16px;
font-family: inherit;
color: #272727;
outline: none;
transition: border-color 0.15s;
```
- Focus: `border-color: #056257`

### Amount Input `.amount-input-wrap`
Dollar prefix `$` in a flex row. Pills below: `$50K $100K $250K $500K $750K $1M`
Pill style: `border: 1.5px solid #d4d4d4; border-radius: 100px; padding: 6px 14px; font-size: 13px`
Active pill: `background: #056257; color: #fff; border-color: #056257`

### Top Bar `.top-bar`
```css
width: 100%; padding: 20px 40px;
display: flex; align-items: center; justify-content: space-between;
```
- **No `border-bottom`**
- Logo: `83×16px` (Ethos SVG, explicit dimensions to prevent stretch)
- Helpline right: phone icon `16×16` + `+1 (415) 237-0145`, `font-size:13px`, `color:#272727`

### Modal / Overlay
```css
/* overlay */
position: fixed; inset: 0;
background: rgba(0,0,0,0.5); backdrop-filter: blur(10px);
z-index: 9999;
display: flex; align-items: center; justify-content: center;
opacity: 0; pointer-events: none; transition: opacity 0.3s ease;
/* modal card */
background: #f5fffe; border-radius: 12px;
padding: 60px 64px; width: 650px; max-width: 92vw;
```

### How It Works Stepper `.hiw-stepper`
Three steps with dot + connector rail. Dot states:
- Done: `background: #056257` + white checkmark SVG
- Active: `border: 2px solid #056257; background: white` + inner filled circle
- Upcoming: `border: 2px solid #d4d4d4; background: white`
Connector line: `2px solid #d4d4d4` (default) → `2px solid #056257` (done)

---

## Layout Rules

- **Max content width:** `560px`, horizontally centred
- **Page horizontal padding:** `24px`
- **Content padding-top:** `20px` (below top bar)
- **Content padding-bottom:** `80px` (clears floating CTA area)
- **Content stack gap:** `24px` between major sections
- Never nest cards inside cards
- Never add `box-shadow` for elevation — use whitespace and borders only

---

## Motion & Animation

| Interaction | CSS |
|-------------|-----|
| Page / screen enter | `fadeSlideUp 0.25s ease` → `opacity:0,translateY(8px)` to `opacity:1,translateY(0)` |
| Button hover | `background 0.2s` |
| Progress fill | `width 0.55s cubic-bezier(0.4,0,0.2,1)` |
| Option tile select | `border-color 0.15s, background 0.15s` |
| Select dropdown open | chevron `transform 0.2s ease` |
| Overlay appear | `opacity 0.3s ease` |
| Input focus | `border-color 0.15s` |

Never use `all` as a transition property — always specify exact properties.

---

## Icons

- Style: **stroke icons**, `stroke-width: 1.75`, `stroke-linecap: round`, `stroke-linejoin: round`
- Inline SVG only (not `<img>`) for all stroke icons
- Sizes: `16×16` (inline), `24×24` (option tile default), `28×28` (feature callout)
- Icon box pattern for raster/Figma icons:
```html
<div style="width:24px;height:24px;overflow:hidden;position:relative;">
  <div style="position:absolute;inset:16.67%;">
    <img style="position:absolute;display:block;max-width:none;width:100%;height:100%;" src="…"/>
  </div>
</div>
```

---

## HTML & Code Rules

1. `box-sizing: border-box` on `*`
2. `margin: 0; padding: 0` reset on `*`
3. Semantic elements: `<button>` for actions, `<a>` for navigation, `<label>` for form labels
4. All buttons need `font-family: inherit`
5. SVG logos must have explicit `width` and `height` — never rely on `width: auto` with `preserveAspectRatio="none"` SVGs
6. Disabled buttons: swap background to `#d4d4d4`, never use `opacity`
7. Inputs: always include `autocomplete` and `inputmode` attributes
8. Never inline sensitive values in URL query params
9. All `transition` rules must specify exact property names, not `all`
10. `@font-face` must include both `.otf` and `.eot` sources for Theinhardt

---

## What NOT to do

- ❌ No `box-shadow` for elevation
- ❌ No `border-bottom` on the top bar
- ❌ No native `<select>` — always use `.custom-select` pattern
- ❌ No placeholder-only labels — always show a `.field-label` above inputs
- ❌ No full-bleed coloured backgrounds — surfaces are always white (`#ffffff`)
- ❌ No font sizes below `12px`
- ❌ No colour outside the token set without explicit product-level approval
