# DFA INTERSECT — implementation plan

## Product scope

Refine the supplied React/Vite automata simulator into DFA INTERSECT, an attractive, mobile-first automata lab. Preserve the existing DFA editing, live graph visualization, parallel simulation, product transition table, batch testing, theory guide, and export modal while improving hierarchy, navigation, responsiveness, and touch ergonomics.

## Design direction

- **Design movement:** Signal glass / midnight laboratory — a focused dark workspace that feels technical without looking like a terminal.
- **Core principles:** (1) make the current experiment obvious, (2) reveal complexity progressively, (3) keep every tap target comfortable on small screens, and (4) use motion/status cues to make automata state changes legible.
- **Color philosophy:** Ink-blue surfaces create calm depth; electric violet owns the product action; cyan and amber distinguish M₁ and M₂; mint communicates acceptance and successful runs; coral is reserved for attention and failure.
- **Layout paradigm:** A responsive lab bench rather than a dashboard grid: a compact command header, one primary experiment card, a grouped menu bar, then the selected workspace. Desktop widens the bench; mobile keeps the menu compact and touch-friendly.
- **Signature elements:** the linked-node mark, a thin signal-gradient rule under active navigation, and small monospace “signal” readouts for state/step metadata.
- **Interaction philosophy:** Inputs look like instruments, actions are named in plain language, and advanced controls stay close to the surface they affect. Every state-changing action has a visible selected/active treatment.
- **Animation:** Use short ease-out fades and 150–220ms lift/shine transitions for cards and tabs. Let the existing simulator pulse/step animation remain the main motion; avoid decorative looping motion that competes with it.
- **Typography system:** Plus Jakarta Sans for interface and headlines; JetBrains Mono for automata symbols, formulas, state IDs, and file/export names. Headline weights are 700–800; metadata is compact uppercase with generous letter spacing.
- **Brand essence:** A visual automata workbench for students and instructors who need to see regular-language operations, not just read about them. Personality: precise, encouraging, kinetic.
- **Brand voice:** Headlines are direct and active; CTAs explain the next outcome. Example lines: “See union logic run in real time.” “Trace one string across three machines.”
- **Wordmark & logo:** A compact linked-node monogram: two cyan/amber DFA states feeding a violet nexus node with an X-shaped cross-product cue, paired with the DFA INTERSECT wordmark.
- **Signature brand color:** Signal violet `#7c5cff`, used for primary actions and active workspace state.

## Implementation

1. Keep the existing product-DFA and simulation contracts intact, extending the engine only with explicit alphabet compatibility validation.
2. Extend `App.tsx` around the existing feature components with independent M₁/M₂ selection state, a Binary/Decimal/All filter, safe product gating, random compatible pairing, swap behavior, and selected-language-derived test strings.
3. Rebuild `TopNav.tsx` as a responsive brand/header component with a grouped feature menu and compact mobile actions.
4. Preserve the signal-glass stylesheet and append responsive searchable-selector, library-card, filter, and compatibility-warning styles.
5. Add `src/utils/dfaGenerators.ts` for deterministic starts/ends, substring, parity/counting, modulo, divisibility, last-digit, exact-word, complement, and small product factories.
6. Add `src/data/dfaLibrary.ts` as a generated, deduplicated catalog of individual binary and decimal language presets while retaining the existing featured pair examples.
7. Add `src/components/LanguagePairSelector.tsx` as the reusable searchable dual-selector and information-card UI.
8. Add `public/manus-routes.json` for the single-page route manifest.
9. Keep child feature components mounted only for the selected workspace to avoid changing their state or behavior; rely on their existing internal controls for detailed interactions.
10. Preserve export behavior and keep the client-only deployment path free of unused credentials and API integrations.

## Project structure

- `src/App.tsx` — application state, scenario selection, workspace shell, feature composition.
- `src/components/TopNav.tsx` — brand mark, desktop/mobile navigation, export action.
- `src/components/ParallelSimulator.tsx` — interactive trace and playback controls.
- `src/components/AutomataCanvas.tsx` — draggable DFA graph visualization.
- `src/components/ProductTransitionTable.tsx` — product table and operation controls.
- `src/components/BatchTester.tsx` — multi-string test suite.
- `src/components/DFAEditor.tsx` — editable M₁/M₂ definitions.
- `src/components/TheoryGuide.tsx` — concept/viva guidance.
- `src/components/ExportModal.tsx` — LaTeX/JSON/CSV/report export.
- `src/components/LanguagePairSelector.tsx` — searchable independent M₁/M₂ language selection.
- `src/data/dfaLibrary.ts` — reusable generated binary/decimal language catalog.
- `src/utils/dfaGenerators.ts` — deterministic DFA factory functions.
- `src/utils/` and `src/types/` — existing automata computation and extended language-preset types.
- `public/manus-routes.json` — managed route manifest for the SPA.
