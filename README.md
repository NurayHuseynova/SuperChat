# SuperChat – Intelligent Chatbot Assistant

**Live Website:** https://superchat-showcase-hub.lovable.app

SuperChat is a multifunctional chatbot project designed to help users with flight searches, shopping products, and cinema showtimes. Users can enter queries in natural language to search for information, compare results, and access different features through a single chat interface.

The main goal of the project is to combine different services into one convenient chatbot and provide users with an easy and interactive experience.

## Main Features

- **Flight Search:** Users can search for suitable flights by specifying departure and destination cities, travel dates, airlines, and price limits. They can also sort, filter, and compare flight results.
- **Shopping:** Users can search for products by name, category, brand, color, and price. Product details, prices, availability, and other characteristics are displayed. Users can also add products to the shopping cart and calculate the total price.
- **Cinema:** Users can search for movies by genre, language, and date. They can access information about cinema showtimes, available seats, and ticket reservations.
- **Conversation Context:** The system maintains information from previous queries and uses it to understand and respond to follow-up questions.
- **Multilingual Support:** The project is designed to support queries and responses in Azerbaijani, English, and Russian.
- **Voice Input:** Users can speak into their microphone and convert their speech into text using the browser's speech recognition capabilities.
- **Intelligent Query Routing:** User messages are analyzed and automatically directed to the appropriate category: flights, shopping, or cinema.

## Technologies and Tools

The project was developed using the following technologies:

- **HTML:** Used to create the structure of the web application.
- **CSS:** Used to design the user interface, colors, layouts, and visual elements.
- **JavaScript:** Used to implement the chatbot logic, query analysis, data searching, filtering, and user interactions.
- **JSON:** Used to store flight, product, movie, cinema, and showtime data.
- **Web Speech API:** Used to convert voice input into text through the browser.

### Development Tools

The following tools were used during the development of the project:

- **Visual Studio Code (VS Code):** Used to create and edit project files, write code, and test the application.
- **Gemini AI:** Used to assist with code generation and the development of application features.
- **ChatGPT:** Used to explain code, develop programming logic, and solve development-related problems.
- **Claude AI:** Used to analyze code, investigate errors, and improve different parts of the project.

## Data Sources

The project uses data from three main categories:

### Flight Data

Flight information is stored in the `data/flights.json` file. It includes airline names, flight numbers, departure and destination cities, dates, prices, baggage information, and seat availability.

### Shopping Data

Product information is stored in the `data/products.json` file. It includes product names, categories, brands, prices, colors, ratings, and stock availability.

### Cinema Data

Cinema-related information is stored in the following JSON files:

- `data/movies.json` – Information about movies.
- `data/cinemas.json` – Information about cinemas.
- `data/showtimes.json` – Movie showtimes and available seats.

**Note:** In the current version, the application uses sample JSON datasets included in the project. Real-time data retrieval through external APIs and actual paid booking services are not currently active.

## Project Structure

The main project files and directories are organized as follows:

```text
superchat-repo/
│
├── index.html
│   # Main application interface and JavaScript logic
│
├── data/
│   ├── flights.json
│   ├── products.json
│   ├── movies.json
│   ├── cinemas.json
│   └── showtimes.json
│   # Project data files
│
├── docs/
│   ├── CODE_WALKTHROUGH.md
│   ├── REPORT_DRAFT.md
│   └── TEST_LOG.md
│   # Code explanations, project report, and test results
│
├── .github/
│   └── workflows/
│       └── pages.yml
│   # Automated GitHub Pages deployment
│
├── run.bat
│   # Startup script for Windows
│
├── run.sh
│   # Startup script for Linux and macOS
│
├── .gitignore
└── README.md
```

## Installation and Running the Project

### 1. Requirements

To run the project, you need Python 3 and a modern web browser. No additional Python packages are required.

### 2. Download the Project

Clone the GitHub repository or download and extract the ZIP archive to your computer.

### 3. Start the Application

Open a terminal in the main project directory and execute the following command:

```bash
python -m http.server 8000
```

### 4. Open the Website

Open your browser and navigate to:

```text
http://localhost:8000
```

Alternatively, Windows users can use the `run.bat` file, while Linux and macOS users can use `run.sh`.

The project can also be tested by opening the `index.html` file directly in a browser.

## Testing and Validation

The project includes a **Run routing self-test** feature at the bottom of the interface to check whether user queries are correctly routed.

The tests cover the following scenarios:

- Correct identification of flight, shopping, and cinema queries.
- Processing messages containing queries from multiple categories.
- Maintaining previous conversation context.
- Correctly handling user follow-up questions.
- Displaying appropriate messages when no matching information is found.

The initial test suite contains 18 queries, all of which produced the expected results (18 successful tests). This represents an initial validation result and does not replace more extensive testing.

## Security and Limitations

In the current version, data is retrieved from local JSON files. Reservation and shopping cart information is stored in memory and may be reset when the page is refreshed.

External API integrations, real payments, and actual ticket booking services are not currently active. Future versions may include real-time data integrations, persistent user data storage, and additional functionality.
