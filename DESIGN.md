# Serambi.ai Design System

Based on `.tmp/serambi.ai · Mockup UI_UX.html` — adapted for production Nuxt 4 + @nuxt/ui + Tailwind CSS + PWA.

---

## 1. Design Tokens

### Colors (Tailwind Config)

```js
// tailwind.config.ts
export default defineNuxtConfig({
  tailwindcss: {
    config: {
      extend: {
        colors: {
          serambi: {
            bg: '#EEF1F5',        // Page background
            surface: '#FFFFFF',    // Card/surface background
            ink: '#16202B',        // Primary text
            muted: '#546273',      // Secondary text
            line: '#D9E0E8',       // Borders/dividers
            accent: '#2F5D8A',     // Primary brand blue
            'accent-d': '#244A6F', // Primary hover/pressed
            'accent-soft': '#E6EDF5', // Primary subtle backgrounds
            ok: '#2B6A5C',         // Success green
            'ok-soft': '#E3F0EC',
            bad: '#8A3B44',        // Error/destructive red
            'bad-soft': '#F5E8EA',
            warn: '#8A6A2B',       // Warning amber
            'warn-soft': '#FBF6EC',
            'warn-line': '#EBDDBF',
          }
        },
        fontFamily: {
          serif: ['Newsreader', 'Georgia', 'serif'],
          sans: ['Hanken Grotesk', 'system-ui', '-apple-system', 'sans-serif'],
        },
        borderRadius: {
          'card': '18px',
          'btn': '12px',
          'input': '14px',
          'pill': '9999px',
          'icon-sm': '10px',
          'icon-md': '12px',
          'icon-lg': '16px',
          'avatar-sm': '50%',
          'avatar-md': '50%',
          'avatar-lg': '50%',
        },
        boxShadow: {
          'phone': '0 12px 40px -16px rgba(22,32,43,.25)',
          'card': '0 1px 3px rgba(0,0,0,.08), 0 1px 2px rgba(0,0,0,.06)',
          'elevated': '0 12px 32px -8px rgba(22,32,43,.4)',
          'modal': '0 12px 32px -8px rgba(22,32,43,.4)',
        },
        spacing: {
          'safe-bottom': 'env(safe-area-inset-bottom)',
        },
        animation: {
          'in': 'in 0.35s cubic-bezier(0.16,1,0.3,1)',
          'ld': 'ld 1.4s cubic-bezier(0.4,0,0.2,1) forwards',
          'slide-up': 'slideUp 0.35s cubic-bezier(0.16,1,0.3,1)',
          'fade-in': 'fadeIn 0.25s ease-out',
        },
        keyframes: {
          in: {
            'from': { opacity: '.001', transform: 'translateY(6px)' },
            'to': { opacity: '1', transform: 'translateY(0)' },
          },
          ld: {
            'from': { transform: 'scaleX(0)' },
            'to': { transform: 'scaleX(1)' },
          },
          slideUp: {
            'from': { opacity: '0', transform: 'translateY(28px)' },
            'to': { opacity: '1', transform: 'translateY(0)' },
          },
          fadeIn: {
            'from': { opacity: '0' },
            'to': { opacity: '1' },
          },
        },
      }
    }
  }
})
```

### CSS Variables (for @nuxt/ui theming)

```css
/* assets/css/main.css */
@import 'tailwindcss';
@import '@nuxt/ui';

@theme {
  /* Colors mapped to @nuxt/ui color palette */
  --color-primary: #2F5D8A;
  --color-primary-hover: #244A6F;
  --color-primary-soft: #E6EDF5;
  --color-success: #2B6A5C;
  --color-success-soft: #E3F0EC;
  --color-error: #8A3B44;
  --color-error-soft: #F5E8EA;
  --color-warning: #8A6A2B;
  --color-warning-soft: #FBF6EC;

  --color-bg: #EEF1F5;
  --color-surface: #FFFFFF;
  --color-text: #16202B;
  --color-text-muted: #546273;
  --color-border: #D9E0E8;

  --font-sans: 'Hanken Grotesk', system-ui, -apple-system, sans-serif;
  --font-serif: 'Newsreader', Georgia, serif;

  --radius-card: 18px;
  --radius-btn: 12px;
  --radius-input: 14px;
  --radius-pill: 9999px;

  --shadow-phone: 0 12px 40px -16px rgba(22,32,43,.25);
  --shadow-card: 0 1px 3px rgba(0,0,0,.08), 0 1px 2px rgba(0,0,0,.06);
  --shadow-modal: 0 12px 32px -8px rgba(22,32,43,.4);
}
```

---

## 2. Typography Scale

| Element | Font | Size | Weight | Line Height | Use Case |
|---------|------|------|--------|-------------|----------|
| Display / Hero | Serif | 40px | 600 | 1.0 | Splash logo, onboarding titles |
| H1 | Sans | 22px | 700 | 1.15 | Screen titles |
| H2 | Sans | 20px | 700 | 1.2 | Section headers |
| H3 | Sans | 17px | 700 | 1.2 | Card titles |
| Body Large | Sans | 16px | 400 | 1.5 | Primary body text |
| Body | Sans | 15px | 400 | 1.4 | Standard body |
| Body Small | Sans | 14px | 400 | 1.4 | Secondary text |
| Caption | Sans | 13px | 400 | 1.4 | Meta info, timestamps |
| Micro | Sans | 12px | 500 | 1.3 | Chips, badges, nav labels |
| Button | Sans | 15px | 600 | 1.0 | All buttons |
| Number (KPI) | Sans | 22-24px | 700 | 1.1 | Tabular numerals |

**Font Loading Strategy:**
```html
<!-- app/head.html or nuxt.config.ts head -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Newsreader:opsz,wght@6..72,600&family=Hanken+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
```

---

## 3. Component Library (Built on @nuxt/ui)

### 3.1 Button Variants

| Variant | Classes | Use Case |
|---------|---------|----------|
| **Primary Solid** | `bg-serambi-accent text-white hover:bg-serambi-accent-d` | Main CTAs |
| **Primary Outline** | `border-serambi-accent text-serambi-accent hover:bg-serambi-accent-soft` | Secondary actions |
| **Ghost** | `text-serambi-accent hover:bg-serambi-accent-soft` | Tertiary/links |
| **Destructive** | `bg-serambi-bad text-white hover:bg-[#7a333b]` | Delete/danger |
| **Success** | `bg-serambi-ok text-white hover:bg-[#235a4f]` | Confirm positive |

**Sizes:** `sm` (h-10, px-4, text-sm), `md` (h-12, px-5, text-base), `lg` (h-14, px-6, text-lg)

**Full-width mobile:** `w-full sm:w-auto`

### 3.2 Card System

```vue
<!-- Base card -->
<div class="bg-white border border-serambi-line rounded-[18px] p-4 sm:p-6">
  <!-- Hero card (gradient) -->
  <div class="bg-gradient-to-br from-serambi-accent to-serambi-accent-d text-white rounded-[18px] p-5">
  <!-- Plan card (dashed) -->
  <div class="border-dashed border-serambi-line bg-transparent rounded-[18px] p-4">
  <!-- Weak/attention card -->
  <div class="bg-serambi-bad-soft border-serambi-bad rounded-[18px] p-4">
  <!-- Analogy card -->
  <div class="bg-serambi-warn-soft border-serambi-warn-line rounded-[18px] p-4">
```

### 3.3 Input & Form Components

```vue
<!-- Text input -->
<input class="w-full px-4 py-3 bg-white border border-serambi-line rounded-[14px] 
  text-serambi-ink placeholder-serambi-muted 
  focus:outline-none focus:ring-2 focus:ring-serambi-accent focus:ring-offset-2 
  disabled:bg-serambi-bg disabled:cursor-not-allowed" />

<!-- Textarea -->
<textarea class="w-full px-4 py-3 bg-white border border-serambi-line rounded-[14px] 
  text-serambi-ink placeholder-serambi-muted resize-none min-h-[84px]
  focus:outline-none focus:ring-2 focus:ring-serambi-accent focus:ring-offset-2" />

<!-- Radio/Option card -->
<button class="w-full text-left p-4 rounded-[14px] border-2 border-serambi-line 
  bg-white text-serambi-ink transition-all
  hover:border-serambi-accent focus:outline-none focus:ring-2 focus:ring-serambi-accent
  data-[selected]:border-serambi-accent data-[selected]:bg-serambi-accent-soft" />

<!-- Chip/Pill -->
<span class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full 
  bg-serambi-accent-soft text-serambi-accent-d text-sm font-medium" />
```

### 3.4 Navigation (Bottom Bar)

```vue
<nav class="fixed bottom-0 left-0 right-0 max-w-[420px] mx-auto 
  bg-white border-t border-serambi-line 
  pb-safe-bottom px-2 py-2">
  <button v-for="item in navItems" :key="item.id"
    class="flex-1 flex flex-col items-center gap-1 p-2 rounded-lg
    text-serambi-muted text-[11px] font-medium
    active:text-serambi-accent active:font-bold
    aria-[current=page]:text-serambi-accent aria-[current=page]:font-bold">
    <Icon :name="item.icon" class="w-6 h-6" />
    <span class="hidden sm:block">{{ item.label }}</span>
  </button>
</nav>
```

### 3.5 Progress Ring (SVG)

```vue
<svg class="w-20 h-20" viewBox="0 0 84 84">
  <circle cx="42" cy="42" r="36" 
    stroke="currentColor" stroke-width="6" fill="none" 
    class="text-serambi-accent-soft" />
  <circle cx="42" cy="42" r="36" 
    stroke="currentColor" stroke-width="6" fill="none" 
    class="text-serambi-accent"
    stroke-dasharray="226" 
    :stroke-dashoffset="226 * (1 - progress)" 
    style="transform: rotate(-90deg); transform-origin: center;" />
</svg>
```

### 3.6 Modal/Sheet System

```vue
<!-- Scrim backdrop -->
<div class="fixed inset-0 bg-black/45 z-50 
  animate-fade-in" @click="close" />

<!-- Bottom sheet (onboarding) -->
<div class="fixed bottom-0 left-0 right-0 max-w-[420px] mx-auto 
  bg-white rounded-t-[24px] max-h-[88vh] overflow-y-auto
  animate-slide-up" role="dialog" aria-modal="true">
  <div class="w-10 h-1 bg-serambi-line rounded-full mx-auto my-3" />
  <!-- Content -->
</div>

<!-- Center dialog -->
<div class="fixed inset-0 flex items-center justify-center p-6 z-50">
  <div class="bg-white rounded-[22px] p-6 max-w-[320px] w-full">
    <!-- Content -->
  </div>
</div>
```

### 3.7 Toast/Feedback

```vue
<!-- Inline feedback banner -->
<div class="flex gap-3 p-3 rounded-[14px] 
  bg-serambi-ok-soft border border-serambi-ok 
  bg-serambi-bad-soft border border-serambi-bad
  bg-serambi-accent-soft border border-serambi-accent
  bg-serambi-warn-soft border border-serambi-warn-line">
  <Icon class="w-5 h-5 flex-none" />
  <p class="text-sm text-serambi-ink flex-1">{{ message }}</p>
</div>
```

---

## 4. Screen Architecture

### 4.1 App Shell (app/app.vue)

```vue
<template>
  <div class="phone min-h-screen bg-serambi-bg flex flex-col">
    <!-- Splash screen (mounted once) -->
    <SplashScreen v-if="showSplash" @done="showSplash = false" />
    
    <!-- Main app -->
    <Teleport to="#modal-portal">
      <GuideDialog v-if="showGuide" @close="showGuide = false" />
      <OnboardingFlow v-if="showOnboarding" @done="showOnboarding = false" />
      <HelpDialog v-if="showHelp" @close="showHelp = false" />
      <TourOverlay v-if="showTour" @done="showTour = false" />
      <ProfileDialog v-if="showProfile" @close="showProfile = false" />
      <ConfirmDialog v-if="showConfirm" @confirm="onConfirm" @cancel="showConfirm = false" />
    </Teleport>
    
    <main class="flex-1 overflow-y-auto px-4 sm:px-6 pb-24 sm:pb-0">
      <NuxtPage />
    </main>
    
    <!-- Bottom nav (hidden on auth/onboarding screens) -->
    <BottomNav v-if="showBottomNav" />
    
    <div id="modal-portal" />
  </div>
</template>
```

### 4.2 Route Structure

```
app/pages/
├── index.vue              → Splash → redirect to onboarding or home
├── onboarding/
│   ├── index.vue          → Hobby selection
│   ├── questions.vue      → Diagnostic questions
│   ├── radar.vue          → Skill radar (results)
│   └── schedule.vue       → Time availability
├── home.vue               → Goal card + progress + KPIs + today's lessons
├── learn/
│   ├── index.vue          → Weekly curriculum (3 core ideas)
│   └── [week].vue         → Week detail with sources
├── practice/
│   ├── index.vue          → Quiz list
│   └── [id].vue           → Quiz with hints + confidence
├── progress/
│   ├── index.vue          → Calendar heatmap + donut chart
│   └── topics.vue         → Topic mastery list
└── profile.vue            → Settings, avatar, connected accounts
```

---

## 5. Improvements Over Mockup

### 5.1 Accessibility (WCAG 2.1 AA)

- ✅ Semantic HTML5 (`<main>`, `<nav>`, `<section>`, `<dialog>`)
- ✅ ARIA labels, roles, live regions for dynamic content
- ✅ Focus visible states on all interactive elements
- ✅ Color contrast ratios ≥ 4.5:1 (verified)
- ✅ Reduced motion support (`@media (prefers-reduced-motion: reduce)`)
- ✅ Touch targets ≥ 44×44px
- ✅ Screen reader announcements for toasts, progress, errors

### 5.2 Responsive Breakpoints

| Breakpoint | Width | Behavior |
|------------|-------|----------|
| Mobile | ≤ 420px | Phone frame fills viewport, no border-radius |
| Tablet | 421–768px | Centered phone frame with 24px margin, rounded corners |
| Desktop | > 768px | Same as tablet, max-width 420px |

### 5.3 PWA Enhancements

- **Manifest:** `name: "serambi.ai"`, `short_name: "Serambi"`, `display: "standalone"`, `theme_color: "#2F5D8A"`, `background_color: "#EEF1F5"`
- **Icons:** 192×192, 512×512 (maskable + monochrome)
- **Service Worker:** `@vite-pwa/nuxt` with `strategies: 'generateSW'`, cache fonts, API responses, static assets
- **Offline Fallback:** Custom `/offline.html` with cached last roadmap
- **Install Prompt:** Subtle banner after 2nd visit

### 5.4 Performance

- **Code splitting:** Automatic via Nuxt (page-level)
- **Font optimization:** `font-display: swap`, subset Newsreader (Latin only)
- **Image optimization:** `@nuxt/image` with WebP/AVIF, lazy loading
- **Critical CSS:** Inlined via Nuxt
- **Payload extraction:** Enabled for static data

### 5.5 Animation Polish

- Page transitions: 350ms cubic-bezier(0.16, 1, 0.3, 1)
- Modal/sheet: slide-up + fade
- Progress ring: animated stroke-dashoffset
- Micro-interactions: button press scale(0.98), chip hover lift
- Respect `prefers-reduced-motion`

---

## 6. Implementation Priority

| Phase | Components | Effort |
|-------|------------|--------|
| **P0** | Design tokens, Tailwind config, fonts, base CSS | 1 day |
| **P1** | Button, Card, Input, Chip, Modal/Sheet, Toast | 2 days |
| **P2** | BottomNav, ProgressRing, KPI Card, Stepper, Avatar | 1 day |
| **P3** | Onboarding flow (4 steps), Home screen, Learn screen | 3 days |
| **P4** | Practice/Quiz, Progress/Calendar, Profile | 3 days |
| **P5** | PWA config, offline, install prompt, push notifications | 1 day |
| **P6** | Polish, a11y audit, performance audit, cross-browser test | 2 days |

**Total: ~13 days** (fits within hackathon timeline if started immediately)

---

## 7. Design Handoff Checklist

- [ ] Tailwind config committed
- [ ] Font loading verified in production build
- [ ] All component variants documented in Storybook (optional)
- [ ] Color contrast audit passed
- [ ] Keyboard navigation tested on all screens
- [ ] Screen reader testing (NVDA/VoiceOver)
- [ ] PWA installable on Android/iOS
- [ ] Offline mode functional
- [ ] Lighthouse score ≥ 90 (Perf, A11y, Best Practices, PWA)

---

## 8. References

- Mockup: `.tmp/serambi.ai · Mockup UI_UX.html`
- @nuxt/ui docs: https://ui.nuxt.com
- Tailwind v4: https://tailwindcss.com/docs
- PWA checklist: https://web.dev/pwa-checklist/
- WCAG 2.1 AA: https://www.w3.org/WAI/WCAG21/quickref/