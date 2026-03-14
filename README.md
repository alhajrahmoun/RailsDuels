# Rails Duels

**Winner — Best Solo** at [Rails Hackathon 2023](https://railshackathon.com/events/2-supporting-rails/winners)

RailsDuels is a real-time multiplayer quiz application where Ruby on Rails developers go head-to-head, testing their knowledge under time pressure. Players select a skill level, get matched with opponents of similar proficiency, and race to answer five Rails questions as quickly and accurately as possible. Every second counts — faster correct answers earn more points.

## Features

### Quick Duels (Ranked Matchmaking)
- Players join a matchmaking queue filtered by skill level
- The system automatically pairs opponents of the same level within seconds
- Each duel consists of **5 multiple-choice questions** drawn from level-appropriate problem sets
- Points are awarded for correct answers, with a **5-point speed bonus** for the fastest submission
- Real-time progress tracking shows both players' advancement during the duel

### Custom Duels
- Create private duels with a unique **invitation code** to share with friends
- Support for **2 to 20 participants** per custom duel
- Choose from existing problem sets or create your own
- Configurable **extra points multiplier** (0–5x) rewarding the first correct answer
- Leader controls when the match starts, with a **10-second countdown** broadcast to all participants
- Live leaderboard updates as participants submit answers

### Skill Levels
Four tiers of difficulty, each with its own question pool and leaderboard:
- **Beginner**
- **Intermediate**
- **Advanced**
- **Expert**

Changing your level resets your points, keeping competition fair within each tier.

### Leaderboard
- Ranked leaderboards per skill level using PostgreSQL window functions (`RANK()`)
- Top 10 displayed per level, with the current user's rank shown if they fall outside the top 10
- Global leaderboard view across all levels

### User Profiles
- Track your duel history with win/loss records
- Monitor your current rank among peers
- Revisit past duels and results

### Problem Sets
- Users can create and manage their own problem sets
- Each problem supports 2–4 multiple-choice options with one correct answer
- Problem sets are categorized by complexity level
- Used in both quick duels (default sets) and custom duels (user-created or default)

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Backend** | Ruby 3.3.5, Rails 7.2 |
| **Database** | PostgreSQL |
| **Real-time** | ActionCable with Redis, Turbo Streams |
| **Frontend** | Hotwire (Turbo + Stimulus), Bootstrap 5.3, Sass |
| **JavaScript** | esbuild, ActionCable, easytimer.js, Clipboard.js |
| **Auth** | Devise |
| **Authorization** | Pundit |
| **Pagination** | Pagy |
| **Testing** | RSpec, Factory Bot, Capybara, SimpleCov |
| **Code Quality** | RuboCop (with Rails, RSpec, Performance plugins) |
| **Server** | Puma |
| **Deployment** | Capistrano with nginx and rbenv |
| **Monitoring** | New Relic |

## Getting Started

### Prerequisites
- Ruby 3.3.5
- PostgreSQL
- Redis
- Node.js and Yarn

### Setup

```bash
# Clone the repository
git clone https://github.com/your-username/RailsDuels.git
cd RailsDuels

# Install Ruby dependencies
bundle install

# Install JavaScript dependencies
yarn install

# Create and set up the database
bin/rails db:create db:migrate db:seed

# Start Redis (required for ActionCable)
redis-server

# Start the Rails server
bin/dev
```

`bin/dev` starts both the Rails server and the CSS/JS build watchers via `Procfile.dev`.

### Running Tests

```bash
# Run the full test suite
bundle exec rspec

# Run with coverage report
COVERAGE=true bundle exec rspec
```

### Linting

```bash
bundle exec rubocop
```

## Deployment

The application is configured for deployment with Capistrano:

```bash
# Deploy to production
cap production deploy
```

Deployment uses nginx as a reverse proxy with Puma as the application server, managed via rbenv for Ruby version control.

## License

This project is open source.
