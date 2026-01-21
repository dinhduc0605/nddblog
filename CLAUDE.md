# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

DucnojinseiBlog - A Ruby on Rails 6.0 personal blog application with a public-facing blog and private admin panel. Uses Ruby 2.7.8, PostgreSQL, and RSpec for testing.

## Common Commands

### Development
```bash
bundle install                    # Install Ruby dependencies
bundle exec rails server          # Start Rails server (port 3000)
bundle exec rails db:migrate      # Run database migrations
bundle exec rails db:reset        # Drop, create, migrate, seed
```

### Testing
```bash
bundle exec rspec                                      # Run all tests
bundle exec rspec spec/requests/static_pages_spec.rb   # Run single test file
bundle exec rspec --format documentation               # Verbose output
```

### Linting
```bash
bundle exec rubocop               # Check code style
bundle exec rubocop -a            # Auto-fix style issues
```

### Docker
```bash
docker-compose up                 # Start app + PostgreSQL
```

## Architecture

### Route Structure
- **Public routes**: `/` (home), `/about`, `/:category_id` (category posts), `/posts/:id`, `/tags/:id`
- **Admin routes**: `/admin` namespace with CRUD for posts, categories, users, image files

### Key Models
- **Post** - Blog posts with FriendlyId slugs, belongs_to User/Category, has_and_belongs_to_many Tags
- **User** - Devise authentication, has_many Posts
- **Category** - FriendlyId slugs, has_many Posts
- **Tag** - FriendlyId slugs, has_and_belongs_to_many Posts
- **ImageFile** - File uploads via CarrierWave

### Controllers
- `PostsController` - Public post display, search, clap toggle
- `StaticPagesController` - Home page, about page, category filtering
- `Admin::PostsController` - Post CRUD with tag management
- `Admin::CategoriesController`, `Admin::UsersController` - Admin management

### Custom Libraries
- `lib/vietnamese_service.rb` - Vietnamese character normalization for FriendlyId slugs
- `lib/slack_notifier.rb` - Slack error notifications

## Code Style Requirements

1. Every Ruby file MUST start with `# frozen_string_literal: true`
2. Max 120 characters per line
3. Max 30 lines per method
4. Max ABC complexity of 20

### Naming Conventions
- Classes/Modules: PascalCase
- Methods/Variables: snake_case
- Constants: SCREAMING_SNAKE_CASE
- Files: snake_case

## Key Dependencies

- **devise** - User authentication
- **friendly_id** - SEO-friendly URL slugs
- **redcarpet** + **coderay** - Markdown rendering with syntax highlighting
- **carrierwave** - File uploads
- **ransack** - Search queries (admin)
- **kaminari** - Pagination
- **rollbar** - Error tracking (production only)

## Internationalization

Available locales: Vietnamese (vi), Japanese (ja). Locale detection uses `http_accept_language` gem.

## Database

PostgreSQL with environment variables: `DATABASE_HOST`, `DATABASE_NAME`, `POSTGRES_USER`, `POSTGRES_PASSWORD`
