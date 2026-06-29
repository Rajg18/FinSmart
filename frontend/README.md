# FinSmart — Personal Finance Manager (Flutter Web)

A responsive web application for personal finance management. Built with Flutter and Riverpod, it connects to the FinSmart Spring Boot backend to provide real-time budget tracking, goal management, subscription monitoring, and spending analytics.

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.41.6 (Web) |
| Language | Dart 3.11.4 |
| State Management | Riverpod 2.6 + code generation (`@riverpod`) |
| Navigation | go_router 14.x (ShellRoute with sidebar) |
| HTTP Client | Dio 5.8 with JWT interceptor |
| Storage | flutter_secure_storage (JWT persistence) |
| Models | Freezed + json_serializable (immutable, type-safe) |
| Charts | fl_chart (bar charts, pie charts) |
| Fonts | Google Fonts |

---

## Features

### Authentication
- Register with real email — account requires email verification before login
- Login with username and password
- Demo mode — isolated sandbox session with no data persistence
- Persistent sessions via secure JWT storage
- Auto-redirect based on auth state

### Dashboard
- Month-to-date income, expenses, and savings rate
- Recent transactions feed
- MockBankFeed simulation (bank sync with 6-hour cooldown)
- Salary detection banner and month-end forecast

### Transactions
- Paginated transaction list with filter chips (All / Income / Expense)
- Filter by category
- Summary pills showing totals for the current filter
- Add, edit, and delete transactions
- Instant feedback — no white-screen flicker on mutations

### Budgets
- Monthly budgets per spending category
- Responsive grid layout
- Progress bars with color coding (green → amber → red as spending rises)
- Alert indicator dots showing which thresholds (50% / 80% / 100%) have triggered emails
- Summary strip with total budgeted, spent, remaining, and over-limit count

### Goals — Pay Yourself First
- Priority-ranked savings goals (#1, #2, #3)
- Status badges (In Progress / Paused / Completed)
- Fund allocation dialog — allocates money and auto-creates a transaction
- Required monthly savings calculator
- Deadline tracking

### Subscriptions
- Grouped by billing cycle (Monthly / Quarterly / Yearly)
- Group subtotals and annual cost summary
- Monthly burden banner
- Pause / resume toggle
- Renewal warning badge when renewal is within 7 days

### Analytics
- Month navigator controls all four sections simultaneously
- **Spending Trends** — side-by-side bar chart (income vs expense), switchable between 3 / 6 / 12 months
- **Category Breakdown** — interactive pie chart with tap-to-highlight sections and legend
- **Top Merchants** — ranked list with relative spend bars
- **Monthly Comparison** — current vs previous month with change pill (up / down)

---

## Screens

```
/login          Login screen
/register       Registration with email verification flow
/dashboard      Main dashboard
/transactions   Transaction list with filters and pagination
/budgets        Budget grid with progress tracking
/goals          Savings goals with fund allocation
/subscriptions  Subscription tracker grouped by cycle
/analytics      Charts and spending insights
```

---

## Project Structure

```
lib/
├── core/
│   ├── constants/       # API endpoints, storage keys
│   ├── network/         # Dio client, JWT interceptor, API exception handler
│   ├── router/          # go_router config with ShellRoute
│   ├── theme/           # App colors, text styles
│   ├── utils/           # Form validators
│   └── widgets/         # Shell scaffold, sidebar nav, loading overlay, app card
│
└── features/
    ├── auth/
    ├── dashboard/
    ├── transactions/
    ├── budgets/
    ├── goals/
    ├── subscriptions/
    └── analytics/
```

Each feature follows the same layered structure:
```
feature/
├── data/
│   ├── models/       # Freezed models with json_serializable
│   └── repositories/ # Dio-based API calls
├── providers/        # Riverpod providers and notifiers
└── presentation/
    └── screens/      # Flutter UI
```

---

## Architecture Highlights

**Riverpod with code generation** — All providers use `@riverpod` annotations. Notifiers follow a CRUD pattern that returns `String?` (error message or null) instead of toggling `AsyncLoading`, preventing white-screen flicker between state transitions.

**Immutable models with Freezed** — All data models are immutable value objects with `copyWith`, pattern matching, and auto-generated JSON serialization. This eliminates entire classes of mutation bugs.

**Dio interceptor for JWT** — A single Dio interceptor attaches the Bearer token to every request and handles 401 responses globally. No token management scattered across the codebase.

**Demo session isolation** — Demo login creates a fresh backend user per session. On logout, all demo data is wiped server-side. Demo users never see each other's data.

---

## Getting Started

### Prerequisites
- Flutter 3.41.6 or later
- Dart 3.11.4 or later
- The [FinSmart Backend](https://github.com/your-username/finsmart-backend) running locally or deployed

### 1. Clone the repository
```bash
git clone https://github.com/your-username/finsmart-frontend.git
cd finsmart-frontend
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Configure the backend URL
Open `lib/core/constants/api_constants.dart` and update:
```dart
static const String baseUrl = 'http://localhost:8080/api/v1';
```
Change `localhost:8080` to your deployed backend URL if running on a server.

### 4. Run the app
```bash
# Web (development)
flutter run -d chrome

# Web (production build)
flutter build web
```

### 5. Regenerate code if you modify models or providers
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Backend

This frontend requires the FinSmart Backend API. See the [backend repository](https://github.com/your-username/finsmart-backend) for setup instructions.

The backend provides:
- JWT authentication with email verification
- Real-time budget tracking via Redis
- Async email alerts via RabbitMQ
- Spring Batch monthly reports

---

## Deployment

```bash
# Build for web
flutter build web --release

# Output is in build/web/
# Deploy to Vercel, Netlify, Firebase Hosting, or any static host
```

Make sure `ApiConstants.baseUrl` points to your deployed backend before building.

---

## License

MIT License
