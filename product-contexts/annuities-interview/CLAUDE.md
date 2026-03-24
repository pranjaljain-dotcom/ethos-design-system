@../../CLAUDE.md

# Annuities Interview — Product Context

## Product Overview
A guided interview flow that qualifies users for annuity products and delivers a personalised recommendation report. Exists as two parallel workflows (A and B) within the same codebase.

## Live URLs
- Workflow A (12 steps): `https://pranjaljain-dotcom.github.io/annuities-interview/workflow-a/`
- Workflow B (6 steps):  `https://pranjaljain-dotcom.github.io/annuities-interview/workflow-b/`
- Report:                `https://pranjaljain-dotcom.github.io/annuities-interview/report/`

## Local Path
`/Users/pranjal.jain/annuities-interview/`

---

## PRD Summary

### Goal
Convert users exploring annuities into qualified leads by collecting enough data to surface a personalised income annuity recommendation, then hand them off to the detailed report.

### User Journey
1. User lands on the interview (step 1)
2. Answers questions about goals, dependents, preferences, financials, location
3. Sees transition screens explaining the product fit and process
4. Enters contact details
5. Sees loading modal (carrier search animation)
6. Arrives at the recommendation report

### Key Outcomes
- Collect: financial goal, dependents, return preference, income start age, investment amount, funding source, state, age, email, phone, name
- Qualify: show "An income annuity sounds like a good fit!" transition when appropriate
- Convert: load report with hero + best-match visible, income chart hidden (`?slim=1`)

---

## Technical Architecture

### SPA Pattern
Single HTML file shell (`index.html`) — all CSS, JS, and step 1 HTML inline. All other steps are partial HTML files fetched via `navigateTo()`.

```js
// Core navigation function
navigateTo(filename, initFn)
// Fetches filename, swaps .content-stack innerHTML, calls initFn()
```

### Session Storage Keys
| Key | Value | Purpose |
|-----|-------|---------|
| `annuity_q1` | string | Financial goal selection |
| `annuity_q2` | JSON array | Dependents multi-select |
| `annuity_name` | string | User's full name |
| `annuity_report_ok` | `'1'` | One-time gate for report access |

### Report Access Guard
- Set `annuity_report_ok = '1'` before navigating to `report/index.html?slim=1`
- Report page reads + immediately deletes the flag
- Hard refresh on report → flag missing → redirect to `index.html` (step 1)

### Slim Mode (`?slim=1`)
Hides `.income-chart` only. Hero and best-match sections remain visible.

---

## Workflow A — 12 Steps

| # Shown | File | Question |
|---------|------|----------|
| 1 of 12 | `index.html` (inline) | What are your financial goals? |
| 2 of 12 | `step2.html` | Who depends on you financially? |
| — | `step3.html` (TS) | How It Works (transition) |
| 3 of 12 | `step4.html` | How familiar are you with annuities? |
| 4 of 12 | `step5.html` | What type of return do you prefer? |
| 5 of 12 | `step6.html` | What age to start receiving income? |
| 6 of 12 | `step7.html` | How much to put in? |
| 7 of 12 | `step8.html` | How do you plan to fund this? |
| 8 of 12 | `step9.html` | What state are you in? |
| — | `ts1.html` | Good Fit (transition) |
| — | `ts2.html` | Almost There (transition) |
| 9 of 12 | `step10.html` | What's your age? |
| 10 of 12 | `step11.html` | Email address |
| 11 of 12 | `step12.html` | Phone number |
| 12 of 12 | `step13.html` | Full name → triggers loading modal |

Navigation chain (JS):
`step1 → step3(TS) → step4 → step5 → step6 → step7 → step8 → step9 → ts1 → ts2 → step10 → step11 → step12 → step13 → [modal] → report`

---

## Workflow B — 6 Steps

| # Shown | File | Question |
|---------|------|----------|
| 1 of 6 | `workflow-b/index.html` | What are your financial goals? |
| 2 of 6 | `workflow-b/step2.html` | Dependents + Return preference (combined) |
| — | `workflow-b/ts-how.html` | How It Works (transition) |
| 3 of 6 | `workflow-b/step3.html` | Investment amount + Income start age (combined) |
| 4 of 6 | `workflow-b/step4.html` | Funding source + State (combined) |
| — | `workflow-b/ts1.html` | Good Fit (transition) |
| — | `workflow-b/ts2.html` | Almost There (transition) |
| 5 of 6 | `workflow-b/step5.html` | Your age |
| 6 of 6 | `workflow-b/step6.html` | Name + Email + Phone (combined contact form) |

---

## Transition Screens

### How It Works (step3.html / ts-how.html)
- Heading: "Great! We'll get you rates and options in minutes."
- 3-step HIW stepper: step 1 done, step 2 active, step 3 upcoming
- No step counter

### Good Fit (ts1.html)
- Heading: "An income annuity sounds like a good fit!"
- 4 "Income For" tiles (dynamically populated from `annuity_q2`): always starts with "You", then selected dependents
- Callout with 4 features: Lifetime Paychecks, Inflation Protection, Family Security, Principal Protection
- No step counter

### Almost There (ts2.html)
- Heading: "Almost there! Here's what comes next."
- HIW stepper: steps 1+2 done, step 3 active
- No step counter

---

## Loading Modal (Search Overlay)
Appears after step 13 / step 6B on Continue click.
- Blurred overlay (`backdrop-filter: blur(10px)`)
- Modal: Ethos logo + "Finding your best rates…" heading + animated progress bar (0→100% over ~3.5s) + carrier logo strip (Prudential, Corebridge, North American, Protective) with CSS scroll animation
- On completion: `sessionStorage.setItem('annuity_report_ok','1')` → `window.location.href = 'report/index.html?slim=1'`

---

## File Map
```
annuities-interview/
├── index.html          ← Shell + all CSS + all JS + step 1 HTML
├── step2–13.html       ← Step partials (fetched by navigateTo)
├── step3.html          ← How It Works transition
├── ts1.html            ← Good Fit transition
├── ts2.html            ← Almost There transition
├── workflow-a/         ← Standalone copy of A (patched paths)
├── workflow-b/         ← Standalone Workflow B (6 steps)
│   ├── index.html
│   ├── step2–6.html
│   ├── ts-how.html, ts1.html, ts2.html
├── report/             ← Annuities report (copy of annuities-preview)
│   └── index.html      ← Has session guard + slim mode script
├── icons/              ← SVG + PNG assets
└── Theinhardt/         ← Self-hosted font files
```

---

## Constraints & Gotchas
- SVG logo has `preserveAspectRatio="none"` — must set `width:83px; height:16px` explicitly
- `navigateTo` fetches relative paths — all partials must be in same directory as the shell
- Report is same-origin (`report/` subfolder) to avoid cross-origin fetch blocks
- Hard refresh on report redirects to step 1 via sessionStorage one-time flag
- Custom selects need JS initialisation — call `initCustomSelect(id, options)` in each step's init function
