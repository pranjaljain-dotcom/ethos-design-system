# Form Components

## Text Input `.text-input`
```css
.text-input {
  width: 100%;
  border: 1.5px solid #d4d4d4;
  border-radius: 8px;
  padding: 14px 16px;
  font-size: 16px;
  font-family: inherit;
  color: #272727;
  outline: none;
  transition: border-color 0.15s;
  box-sizing: border-box;
}
.text-input:focus { border-color: #056257; }
.text-input::placeholder { color: #7e7e7e; }
```
Always pair with a `.field-label` above. Never use placeholder as the only label.

## Field Label `.field-label`
```css
.field-label {
  font-size: 13px;
  font-weight: 500;
  color: #272727;
  margin-bottom: 8px;
  display: block;
}
```

## Custom Select `.custom-select`
Replaces native `<select>`. Never use a native select element.

Structure:
```html
<div class="custom-select" id="select-foo">
  <div class="custom-select-trigger">
    <span class="select-value">Placeholder</span>
    <svg class="select-chevron" …>…</svg>
  </div>
  <div class="custom-select-dropdown"></div>
</div>
```
- Trigger height: `52px`
- Dropdown: populates via JS, `max-height: 240px; overflow-y: auto`
- Selected option: `background: #f5fffe; color: #056257; font-weight: 500`
- Chevron: rotates `180deg` when open via JS `classList.toggle('open')`

## Amount Input `.amount-input-wrap`
```html
<div class="amount-input-wrap">
  <span class="amount-prefix">$</span>
  <input class="text-input" type="text" id="amount-input" placeholder="500,000" inputmode="numeric"/>
</div>
```
Prefix `$` is a sibling flex item, not padding.

## Phone Input `.phone-wrap`
```html
<div class="phone-wrap">
  <div class="phone-prefix">+1</div>
  <input class="text-input" type="tel" id="phone-input" placeholder="(555) 000-0000" autocomplete="tel" inputmode="tel"/>
</div>
```

## Option Tile List `.options-list`
```html
<div class="options-list">
  <div class="option-card" data-single data-value="foo">
    <div class="option-icon-box"><!-- SVG icon --></div>
    <div class="option-card-body">
      <span class="option-card-text">Label</span>
      <span class="option-card-sub">Optional sub-label</span>
    </div>
    <!-- Single: -->  <div class="addr-radio"><div class="addr-radio-check"><img …/></div></div>
    <!-- Multi:  -->  <div class="tile-check"></div>
  </div>
</div>
```
- `data-single`: radio behaviour (one at a time)
- `data-multi`: checkbox behaviour (multiple allowed)
- `.options-list` gap: `12px`
