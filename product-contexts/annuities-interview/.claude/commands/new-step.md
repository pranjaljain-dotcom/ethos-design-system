# /new-step

Create a new step screen for the Annuities Interview flow.

## Usage
```
/new-step <step-number> <total-steps> <question> [input-type]
```

**Input types:** `single-choice` | `multi-choice` | `dropdown` | `amount` | `text` | `email` | `phone`

## What this does
1. Creates `step{N}.html` as a partial (no `<html>` wrapper — just content stack)
2. Adds the navigation wiring instructions for `index.html`
3. Follows all Ethos DS rules: correct counter, heading, input type, back button, continue button

## Template

For a **single-choice** step:
```html
<script>if(typeof navigateTo==='undefined'){window.location.replace('index.html');}</script>
<div class="content-stack">
  <div class="back-bar">
    <a class="back-btn" id="btn-back">
      <div style="width:24px;height:24px;overflow:hidden;position:relative;flex-shrink:0;">
        <div style="position:absolute;inset:16.67%;">
          <img alt="" style="position:absolute;display:block;max-width:none;width:100%;height:100%;" src="icons/54153925-8d30-453b-835c-430c5c5d1674.svg"/>
        </div>
      </div>
      <span>Back</span>
    </a>
  </div>
  <div class="card">
    <p class="step-counter">{N} of {TOTAL}</p>
    <h1 class="q-heading">{QUESTION}</h1>
    <p class="q-desc">{DESCRIPTION}</p>
    <div class="options-list" style="margin-top:24px;">
      <!-- option cards here -->
    </div>
    <button class="btn-continue btn-disabled" id="btn-continue" disabled>Continue</button>
  </div>
</div>
```

After creating the file, provide the `initStep{N}()` function to paste into `index.html`.
