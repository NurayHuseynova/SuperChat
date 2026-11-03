# Code Walkthrough (for the 5-minute demo)

All code is in `index.html`, in one `<script>` block, in this order. Be ready to explain each part in your own words.

## 1. Data layer
`MockSource` returns the embedded JSON; `ApiSource` is the Phase 2 placeholder. The three repositories are the only way handlers touch data. Question to expect: "How would you plug in the real API?" Answer: implement `ApiSource.all(kind)`, map to the Appendix A schema, swap one line.

## 2. State
`fresh()` creates session state plus one state object per domain. `S` is the live state. Each handler stores its last result list and selection there, which is why "the second one" and "back to the headphones" work.

## 3. Helpers
`pDate` resolves "Friday", "tonight", "6 November" against the reference date 2 Nov 2026 (`REF`). `cities` finds origin and destination using "from/to" words and Azerbaijani suffixes. `pick` resolves "first/second/cheaper". `priceMax` reads "under 100".

## 4. Handlers
`flights(x)`, `shopping(x)`, `cinema(x)`. Each decides whether the message is a new search or a follow-up on stored state, filters data from the repository, saves the result list in state, and formats a reply. Missing data produces an honest "nothing found" message.

## 5. Router
`route(x, last)`: tests the flights, shopping and cinema patterns, then applies the decision order (mixed, single domain, follow-up, ambiguous, out of scope). Shopping keywords come from the catalogue via `vocab()`.

## 6. `answer()`
Detects language, calls `route`, dispatches to the handler(s), and wraps everything in try/catch so data errors never show a stack trace.

## 7. UI
Chat rendering, quick-start chips, voice input with `SpeechRecognition`, and the self-test button.

## Likely questions and where to look
- Why rules instead of an LLM? See report section 2.
- What breaks it? Unusual phrasing, typos; see TEST_LOG.
- How is mixed intent handled? `route` returns `mixed`, `answer` calls each module and joins replies.
- How does a follow-up know its domain? `S.sess.last`.
