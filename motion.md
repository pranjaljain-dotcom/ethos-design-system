# Motion & Animation Rules

## Principles
1. Motion should guide attention, not distract
2. Enter animations: always `fadeSlideUp` — things come from below, not sides
3. Duration: fast for micro-interactions (<200ms), moderate for page transitions (250ms), slow for progress/loading (500ms+)
4. Never animate `all` — always specify exact CSS properties

## Keyframes
```css
@keyframes fadeSlideUp {
  from { opacity: 0; transform: translateY(8px); }
  to   { opacity: 1; transform: translateY(0); }
}
```

## Standard Durations
| Interaction | Duration | Easing |
|-------------|----------|--------|
| Page / screen enter | `0.25s` | `ease` |
| Button hover | `0.2s` | `ease` |
| Tile select | `0.15s` | `ease` |
| Input focus border | `0.15s` | `ease` |
| Progress bar fill | `0.55s` | `cubic-bezier(0.4,0,0.2,1)` |
| Overlay appear | `0.3s` | `ease` |
| Select chevron rotate | `0.2s` | `ease` |
| Select dropdown open | `0.15s` | `ease` |

## Loading / Carousel Animation
For carrier logo carousels during loading states:
```css
@keyframes carrier-scroll {
  0%   { transform: translateX(0); }
  100% { transform: translateX(-148px); }
}
animation: carrier-scroll 3s ease-in-out infinite alternate;
```

## Rules
- Screen transitions use `animation: fadeSlideUp 0.25s ease both` on `.content-stack`
- Never use `transition: all` — specify individual properties
- Disabled states should not animate (use `pointer-events: none` instead)
- Progress bar uses `cubic-bezier(0.4,0,0.2,1)` (Material easing) for a satisfying fill feel
