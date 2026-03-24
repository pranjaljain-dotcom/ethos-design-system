# Navigation Components

## Top Bar `.top-bar`
```css
.top-bar {
  width: 100%;
  padding: 20px 40px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
```
- **No border-bottom**
- Logo: `<img class="ethos-logo" src="icons/…" style="height:16px;width:83px;display:block;flex-shrink:0;" />`
  - Always set explicit `width` and `height` — SVG has `preserveAspectRatio="none"` so `width:auto` stretches it
- Helpline (right side):
```html
<div class="top-bar-right">
  <a class="top-bar-phone" href="tel:+14152370145">
    <div class="top-bar-phone-icon">…phone icon…</div>
    +1 (415) 237-0145
  </a>
</div>
```

## Progress Bar `.progress-wrap`
Sits immediately below the top bar, above all content.
```css
.progress-wrap { width: 100%; max-width: 560px; margin-bottom: 40px; }
```
Update via: `document.querySelector('.progress-fill').style.width = (step/total*100) + '%'`

## Back Bar `.back-bar`
Appears at the top of every step card (except step 1).
```css
.back-bar { display: flex; align-items: center; min-height: 28px; }
```
Contains a single `.back-btn` that triggers `navigateTo(prevFile, initPrevFn)`.

## Step Counter `.step-counter`
`X of Y` label above the question heading. Present on all numbered steps, absent on transition screens.
```css
.step-counter {
  font-size: 13px; font-weight: 500;
  color: #7e7e7e;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  margin-bottom: 12px;
}
```

## How It Works Stepper `.hiw-stepper`
Three-step process indicator used on transition screens.

Dot states:
- **Done** → `background:#056257` + white checkmark SVG inside
- **Active** → `border:2px solid #056257; background:#fff` + `::after` filled teal circle
- **Upcoming** → `border:2px solid #d4d4d4; background:#fff`

Connector line: `2px; background:#d4d4d4` (default) → `background:#056257` (done)

Badge above stepper:
```css
.hiw-badge {
  display: inline-flex; align-items: center;
  border: 1.5px solid #056257; border-radius: 100px;
  padding: 4px 14px;
  font-size: 13px; font-weight: 500; color: #056257;
}
```
