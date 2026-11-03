# SuperChat: Technical Report (draft, max 4 pages)

> Edit this draft so it reflects what you actually understand and changed. Replace bracketed notes with your own results.

## 1. Architecture

SuperChat is a single-page web app. One chat window sends every message through a router, which hands it to the Flights, Shopping or Cinema module (or several, for mixed requests). Modules read data only through repository interfaces and write to per-domain state. Layers: UI, router, domain handlers, state, data layer.

## 2. Routing method and trade-offs

Hybrid-free, rule-based classification: keyword and pattern sets for each domain (EN/RU/AZ), with the shopping vocabulary built automatically from the product catalogue. Decision order:

1. Count matching domains. Two or more means **mixed**; all matching modules are called and replies are combined.
2. One match means that domain.
3. No match but the message contains anaphora or ordinal markers ("the cheaper one", "and for Saturday?") and a domain was active: **follow-up**, resolved against the last active domain.
4. Vague phrases ("show me something good", "book it") with no context: **ambiguous**, one clarifying question.
5. Otherwise **out of scope**: polite refusal with examples of what is supported.

Trade-offs: rules are fast, deterministic, free and work offline, and are easy to explain and debug. They are brittle on unusual phrasing and need maintenance per language. An LLM function-calling router would generalise better but adds latency, cost and non-determinism. [Describe whether you plan to add an LLM fallback.]

## 3. State handling

- **Session state:** detected language, last active domain.
- **Flights:** current result list, selected flight.
- **Shopping:** current result list, selected product, cart, search history (used for "back to the headphones").
- **Cinema:** current showtime list, selected showtime.
- **Reservations:** mock list with reference numbers, no payment.

References like "the second one" or "the cheaper one" are resolved against the active domain's current list. Returning to a domain restores its state unchanged.

## 4. Data layer design

`FlightRepository`, `ProductRepository` and `ShowtimeRepository` wrap a data source object (`MockSource` now, `ApiSource` in Phase 2). Handlers never read JSON directly. Switching to the real APIs means implementing the adapter that maps responses to the Appendix A schema, adding authentication, pagination, caching and logging there.

## 5. Known limitations

- Rule-based routing can miss unusual wording or typos.
- Date parsing covers weekdays, "today/tomorrow/tonight" and "N November" in three languages, not arbitrary formats.
- Round-trip flights are not supported.
- Reservations are in memory and reset on reload.
- Voice input uses the browser's speech recognition: one click to start, automatic stop on silence, no continuous hands-free listening and no spoken replies. Visual search is not implemented.
- [Add limitations you find while testing.]

## 6. Tools and sources

- Claude (Anthropic) generated the first implementation from the competition specification; [describe exactly what you reviewed, changed or added yourself].
- No third-party libraries. Browser Web Speech API for voice input.
- Official mock dataset supplied by the organisers.
