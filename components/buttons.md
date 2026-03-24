# Button Components

## Primary CTA `.btn-continue`
The main progression button. Always full-width within the content column.

```css
.btn-continue {
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
}
.btn-continue:hover { background: #044d44; }
.btn-continue.btn-disabled,
.btn-continue:disabled {
  background: #d4d4d4;
  cursor: not-allowed;
}
```
**Rule:** Use `background: #d4d4d4` for disabled, never `opacity`.

## Back Button `.back-btn`
Inline text link with back arrow icon. Left-aligned, no background.

```css
.back-btn {
  display: flex;
  align-items: center;
  gap: 6px;
  cursor: pointer;
  text-decoration: none;
  background: none;
  border: none;
  font-family: inherit;
}
.back-btn span {
  font-size: 18px;
  font-weight: 500;
  color: #272727;
}
```

## Amount Pill `.amount-pill`
Quick-select shortcut below amount inputs.

```css
.amount-pill {
  border: 1.5px solid #d4d4d4;
  border-radius: 100px;
  padding: 6px 14px;
  font-size: 13px;
  font-weight: 500;
  color: #272727;
  background: #fff;
  cursor: pointer;
  font-family: inherit;
  transition: background 0.15s, color 0.15s, border-color 0.15s;
}
.amount-pill.selected,
.amount-pill:hover {
  background: #056257;
  color: #fff;
  border-color: #056257;
}
```
