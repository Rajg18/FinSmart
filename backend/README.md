# FinSmart — Personal Finance Intelligence API

A production-grade REST API for personal finance management. Built with Spring Boot 3, it handles real-time budget tracking, goal management, subscription monitoring, async email alerts via RabbitMQ, and monthly financial reports via Spring Batch.

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Spring Boot 3.3.5 |
| Language | Java 17 |
| Database | MySQL 8 + Spring Data JPA |
| Cache | Redis (real-time budget counters) |
| Messaging | RabbitMQ (async alert pipeline) |
| Security | Spring Security + JWT (JJWT 0.12) |
| Email | JavaMailSender + Gmail SMTP |
| Batch | Spring Batch (monthly reports, chunk=10) |
| Schedulers | Spring Scheduler (budget reset, goal check, subscription reminders) |
| Docs | SpringDoc OpenAPI 3 / Swagger UI |
| Build | Maven |

---

## Features

### Authentication
- Register with email verification — users must confirm their email before logging in
- JWT-based stateless authentication (24h expiry)
- Isolated demo sessions — each demo login creates a fresh sandbox user, all data is wiped on logout
- Role-based access (USER / DEMO)

### Transactions
- Full CRUD with soft delete
- Category and type filtering (DEBIT / CREDIT)
- Paginated results with sorting
- Merchant tracking for analytics

### Budgets
- Monthly budgets per category
- Real-time spending tracked via Redis atomic counters
- Automated alerts at 50%, 80%, and 100% thresholds via RabbitMQ → Email pipeline
- Deduplication flags prevent repeated alerts for the same threshold

### Goals — Pay Yourself First
- Priority-ordered savings goals
- Manual fund allocations create GOAL_ALLOCATION transactions automatically
- Auto-completion when target is reached
- Required monthly savings calculator
- Deadline-based alerts via scheduler

### Subscriptions
- Monthly / Quarterly / Yearly billing cycles
- Normalized monthly burden calculation
- Pause / resume toggle
- 7-day renewal reminder alerts

### Dashboard
- Month-to-date income, expenses, savings rate
- Recent transactions feed
- MockBankFeed with 6-hour cooldown (simulates bank sync)
- Salary detection and month-end forecast

### Analytics
- Category breakdown with percentage share
- Monthly comparison (current vs previous month)
- Spending trends (3 / 6 / 12 months)
- Top merchants by spend

### Email Alerts
- Email verification on registration
- Budget threshold alerts (50% / 80% / 100%)
- Goal deadline missed alerts
- Subscription renewal reminders (7 days before)
- Monthly financial report via Spring Batch

### Spring Batch
- Monthly report job — reads all users, generates personal finance summaries, sends via email
- Chunk-oriented processing (chunk size = 10)
- Trigger via `POST /batch/monthly-report/run` or auto-scheduled on the 1st of each month

---

## Architecture

```
Client Request
      │
      ▼
Spring Security (JWT Filter)
      │
      ▼
REST Controller
      │
      ▼
Service Layer
      │
   ┌──┴──────────────────┐
   │                     │
   ▼                     ▼
MySQL (JPA)          Redis Cache
(persistent data)    (budget counters)
                         │
                         ▼
                   AlertProducer
                         │
                         ▼
                     RabbitMQ
                         │
                         ▼
                   AlertConsumer
                         │
                         ▼
                   EmailService (Gmail SMTP)
```

---

## Project Structure

```
src/main/java/com/finsmart/
├── config/           # RabbitMQ, Redis, Security, Swagger, Batch job config
├── controller/       # REST controllers (Auth, Transaction, Budget, Goal, Subscription, Dashboard, Analytics, Batch)
├── dto/              # Request / Response records
├── entity/           # JPA entities (User, Transaction, Budget, Goal, Subscription)
├── exception/        # Global exception handler, custom exceptions
├── mapper/           # MapStruct mappers
├── messaging/        # AlertProducer, AlertConsumer, AlertMessage
├── repository/       # Spring Data JPA repositories
├── scheduler/        # BudgetReset, GoalCheck, SubscriptionReminder, MonthlyReport
├── security/         # JWT util, auth filter, user details service
├── service/          # Business logic (Auth, Budget, Goal, Transaction, Subscription, Dashboard, Analytics, Email)
└── batch/            # Spring Batch reader, processor, writer
```

---

## API Overview

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/register` | Register — sends verification email |
| GET | `/auth/verify?token=` | Verify email and activate account |
| POST | `/auth/login` | Login with JWT response |
| POST | `/auth/demo` | Start isolated demo session |
| POST | `/auth/logout` | Logout — wipes demo data if demo user |
| GET | `/transactions` | Paginated transaction list with filters |
| POST | `/transactions` | Create transaction (triggers budget update) |
| GET | `/budgets` | Current month budgets with % used |
| GET | `/goals` | All goals with progress and required monthly |
| POST | `/goals/{id}/allocate` | Allocate funds to a goal |
| GET | `/subscriptions` | All subscriptions grouped by cycle |
| PATCH | `/subscriptions/{id}/toggle` | Pause or resume a subscription |
| GET | `/dashboard` | Full dashboard summary |
| POST | `/bank-feed/sync` | Simulate bank transaction import |
| GET | `/analytics/category-breakdown` | Spending by category |
| GET | `/analytics/spending-trend` | 3 / 6 / 12 month trend |
| GET | `/analytics/top-merchants` | Top merchants by spend |
| GET | `/analytics/monthly-comparison` | Month-over-month comparison |
| POST | `/batch/monthly-report/run` | Trigger monthly report batch job |

Full interactive docs: `http://localhost:8080/api/v1/swagger-ui.html`

---

## Getting Started

### Prerequisites
- Java 17+
- MySQL 8
- Docker (for Redis and RabbitMQ)
- Maven

### 1. Clone the repository
```bash
git clone https://github.com/your-username/finsmart-backend.git
cd finsmart-backend
```

### 2. Start Redis and RabbitMQ
```bash
docker compose up -d redis rabbitmq
```

### 3. Set environment variables
Copy `.env.example` and fill in your values:
```bash
cp .env.example .env
```

| Variable | Description |
|----------|-------------|
| `DB_PASSWORD` | MySQL root password |
| `JWT_SECRET` | Minimum 32-character secret key |
| `MAIL_USERNAME` | Gmail address |
| `MAIL_PASSWORD` | Gmail App Password (not your login password) |
| `APP_BASE_URL` | Base URL for email links (e.g. `https://yourdomain.com/api/v1`) |

### 4. Run the application
```bash
mvn spring-boot:run
```

The API will be available at `http://localhost:8080/api/v1`

### 5. Explore the API
Open Swagger UI: `http://localhost:8080/api/v1/swagger-ui.html`

---

## Environment Variables Reference

```env
DB_URL=jdbc:mysql://localhost:3306/finsmart?createDatabaseIfNotExist=true
DB_USERNAME=root
DB_PASSWORD=your_mysql_password

JWT_SECRET=your_minimum_32_char_secret_here

MAIL_USERNAME=your_gmail@gmail.com
MAIL_PASSWORD=your_gmail_app_password

APP_BASE_URL=http://localhost:8080/api/v1

RABBITMQ_HOST=localhost
RABBITMQ_PORT=5672
RABBITMQ_USERNAME=guest
RABBITMQ_PASSWORD=guest
```

---

## Key Design Decisions

**Redis for budget counters** — Instead of updating the MySQL `spent_amount` column on every transaction (causing write contention under load), spending is tracked using Redis `INCR` operations. MySQL is synced periodically and used as the source of truth for persistence.

**RabbitMQ for email alerts** — Budget alerts are decoupled from the transaction API response. The HTTP request completes instantly; the email is sent asynchronously through the queue. If the email service is temporarily down, the message stays in the queue and retries automatically.

**Demo session isolation** — Each demo login generates a unique user (`demo_<uuid>`). On logout, all their data is permanently deleted. This prevents demo data pollution across sessions.

**Spring Batch for reports** — Monthly reports use chunk-oriented processing so large user bases are handled in memory-safe batches of 10, not loaded all at once.

---

## License

MIT License — free to use, modify, and distribute.
