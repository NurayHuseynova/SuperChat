# Routing Test Log

Built-in self-test (button on the page): 18 messages, 18 correct (100%).

Caveat: the set is small and was written by the same author as the router, so it overstates real accuracy. Before submitting, add your own larger set (aim for 50 to 100 messages across all three languages, with paraphrases and typos) and report the numbers here.

## Spec conversations (all pass)

| # | Conversation | Result |
|---|---|---|
| 1 | Flight → film → headphones | Routed to 3 domains correctly |
| 2 | Films → laptops → "the sci-fi one, seats on Saturday?" | Returned to cinema, filtered by genre and date |
| 3 | Laptops → "the second one, in stock?" | Follow-up resolved to Laptop 15" Pro |
| 4 | Flights → "the cheaper one, is it direct?" | Resolved to cheapest flight, answered stops |
| 5 | Flight and backpack in one message | Mixed, both modules answered |
| 6 | "Show me something good." | Clarifying question |
| 7 | Weather in Ganja | Out of scope |
| 8 | "Book two seats" without context | Asks which film and showtime |

## Error analysis

| Message | Expected | Got | Cause / fix |
|---|---|---|---|
| (add your failures here) | | | |

Known weak spots to test: misspellings, slang, mixed-language sentences, very short replies without clear context, bare "book it" after switching domains.
