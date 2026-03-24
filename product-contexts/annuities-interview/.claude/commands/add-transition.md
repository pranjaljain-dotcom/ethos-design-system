# /add-transition

Create a new transition screen for the Annuities Interview flow.

## Usage
```
/add-transition <filename> <type>
```

**Types:** `how-it-works` | `good-fit` | `almost-there` | `custom`

## What this does
1. Creates `{filename}.html` as a partial — no step counter, no progress increment
2. Adds a heading, optional illustration/stepper, and a Next CTA
3. Wires back/next navigation

## Rules for transition screens
- No `.step-counter` element
- No progress bar update in the init function
- Heading uses `.q-heading`
- "Next" button (not "Continue") unless the screen collects data
- Back button navigates to the step before this transition
- Next button navigates to the step after this transition

## How It Works Template
```html
<div class="card">
  <h1 class="q-heading">{HEADING}</h1>
  <div class="hiw-badge" style="margin-top:32px;">How it works</div>
  <div class="hiw-stepper">
    <!-- Step 1: done, Step 2: active/done, Step 3: active/upcoming -->
  </div>
  <button class="btn-continue" id="btn-continue">Next</button>
</div>
```

## Good Fit Template
Uses dynamic income tiles populated from `sessionStorage.getItem('annuity_q2')`.
Includes 4-feature callout block: Lifetime Paychecks · Inflation Protection · Family Security · Principal Protection.
