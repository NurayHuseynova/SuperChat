# SuperChat

One chat window for flights, shopping and cinema. Messages are routed to the right module automatically, context is kept per domain, and the conversation works in English, Russian and Azerbaijani.

Phase 1 build, running on the official mock dataset (reference date: Monday, 2 November 2026).

## Run it (one command)

```bash
./run.sh
```

Then open http://localhost:8000. On Windows use `run.bat`. Python 3 is the only requirement; there are no packages to install and no internet access is needed.

You can also just open `index.html` in a browser, since the page and the dataset are self-contained.

## Hosted version

Live demo: https://superchat-showcase-hub.lovable.app

To host your own copy, push this repo to GitHub, then in **Settings → Pages** set the source to **GitHub Actions**. The workflow in `.github/workflows/pages.yml` publishes the site on every push to `main`.

## Features

- Single chat, no manual mode selection; each reply is tagged with the domain that handled it
- Routing into 7 categories: flights, shopping, cinema, mixed, follow-up, ambiguous, out of scope
- Separate state per domain plus shared session state ("back to the headphones" restores the earlier list)
- Flights: search, filters, sorting, details, comparison, mock reservation
- Shopping: text, price and colour search, availability, comparison, cart with total
- Cinema: films by genre, language and date, showtimes, seat availability, mock reservation
- The assistant answers only from the data; if nothing matches it says so
- Data errors are caught and shown as a friendly message
- Bonus: EN / RU / AZ with per-message language detection, browser voice input (Chrome/Edge): press the mic once, speech is transcribed and enters the same router, and recognition stops automatically when the speaker pauses. It is not hands-free, so continuous voice activity detection is not implemented

## Architecture

```
index.html
├── Data layer    MockSource / ApiSource  →  FlightRepository, ProductRepository, ShowtimeRepository
├── State         session (lang, last domain) + per-domain state (flights, shopping, cinema)
├── Router        rule-based classifier  →  7 categories
├── Handlers      flights(), shopping(), cinema()
└── UI            chat log, quick-start chips, voice input, routing self-test
```

## Moving to real APIs (Phase 2)

All data access goes through the three repository objects. To switch sources, implement `ApiSource.all(kind)` so it fetches from the real Aviasales, Shopping Assistant and CinemaPlus endpoints and maps the responses to the Appendix A schema, then change `const SRC = new MockSource(DATA)` to `new ApiSource(config)`. The handlers do not need to change. Authentication, pagination, caching and logging belong inside the adapter.

## Tests

Click **Run routing self-test** at the bottom of the page for the built-in routing check. Results and error analysis are recorded in `docs/TEST_LOG.md`.

## AI assistance and sources

This project was built with the help of an AI language model (Claude, by Anthropic), which produced the first implementation from the competition specification. The author reviewed, tested and is responsible for the submitted code. No external libraries are used. The dataset is the official mock dataset supplied by the organisers (`data/`).
