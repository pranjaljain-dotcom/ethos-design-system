@../../CLAUDE.md

# Policy Owner Flow (AAA) — Product Context

## Product Overview
A mobile-first onboarding flow for existing AAA/insurance policy owners to verify identity, confirm policy details, and access their digital policy dashboard.

## Live URL
`https://pranjaljain-dotcom.github.io/modal-preview/policy-owner.html`

## Local Path
`/Users/pranjal.jain/modal-preview/`

---

## PRD Summary

### Goal
Allow existing policy owners to securely verify their identity and gain access to their policy management dashboard through a streamlined, low-friction onboarding experience.

### User Journey
1. Policy owner arrives at landing screen (`policy-owner.html`)
2. Enters email to receive OTP (`po-email.html`)
3. Verifies via OTP code (`po-otp.html`)
4. Fills in policy / personal details (`po-form.html`)
5. Confirms details (`policy-owner-confirm.html`)
6. Loading / processing state (`po-loading.html`)
7. Mobile-specific variant (`po-mobile.html`)

### Key Outcomes
- Verify identity without password friction
- Collect or confirm: email, OTP, policy details
- Transition to authenticated policy dashboard

---

## Technical Architecture

### Structure
Multi-page HTML flow (not a SPA). Each screen is a standalone `.html` file. Navigation is via `window.location.href` or anchor links.

### Files
| File | Screen | Purpose |
|------|--------|---------|
| `policy-owner.html` | Entry / landing | First touchpoint, CTA to begin |
| `po-email.html` | Email input | Collect email for OTP |
| `po-otp.html` | OTP verification | 6-digit code entry |
| `po-form.html` | Details form | Policy / personal info |
| `policy-owner-confirm.html` | Confirmation | Review before submit |
| `po-loading.html` | Processing | Animated loading state |
| `po-mobile.html` | Mobile variant | Mobile-optimised view |
| `investment-widget.html` | Widget | Standalone investment display widget |

### Assets
```
modal-preview/
├── policy-owner.html
├── po-email.html
├── po-otp.html
├── po-form.html
├── policy-owner-confirm.html
├── po-loading.html
├── po-mobile.html
├── investment-widget.html
├── index.html              ← Separate component (not part of PO flow)
├── icons/                  ← SVG + PNG assets
└── Theinhardt/             ← Self-hosted font files
```

---

## Design Constraints
- Mobile-first layout — primary viewport is 390px (iPhone 14)
- Follows Ethos design system tokens and components exactly
- OTP input: 6 individual character boxes, auto-advance on input
- Loading screen: animated spinner or progress indicator
- Forms use the standard `.text-input` + `.field-label` pattern from design system

---

## Constraints & Gotchas
- `index.html` and `investment-widget.html` are separate standalone components — not part of the policy owner flow
- Multi-page navigation means each page must be self-contained (no shared JS shell)
- Font and icon paths are relative to each file's location
