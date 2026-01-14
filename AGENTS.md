# AGENTS.md - Guidelines for AI Coding Agents

This document provides essential information for AI coding agents working in this repository.

## Project Overview

**Ruby on Rails 6.0 blog application** (DucnojinseiBlog) with Vue.js 2.6 frontend.

- **Language:** Ruby (target 2.5, Docker uses 2.7.8)
- **Framework:** Ruby on Rails 6.0
- **Frontend:** Vue.js 2.6 with Element UI, managed via Webpacker
- **Database:** PostgreSQL
- **Testing:** RSpec
- **Linting:** RuboCop

## Build and Development Commands

### Setup
```bash
bundle install                    # Install Ruby dependencies
yarn install                      # Install JavaScript dependencies
bundle exec rails db:create       # Create database
bundle exec rails db:migrate      # Run migrations
```

### Running the Application
```bash
bundle exec rails server          # Start Rails server (default: port 3000)
bin/webpack-dev-server            # Start Webpack dev server (for hot reload)
```

### Testing Commands
```bash
bundle exec rspec                                      # Run all tests
bundle exec rspec spec/requests/static_pages_spec.rb   # Run a single test file
bundle exec rspec spec/requests/static_pages_spec.rb:11  # Run a single test by line number
bundle exec rspec --format documentation              # Run tests with verbose output
```

### Linting Commands
```bash
bundle exec rubocop               # Run RuboCop on all files
bundle exec rubocop -a            # Run RuboCop with auto-correction
bundle exec rubocop path/to/file.rb  # Run RuboCop on specific file
sh/rubocop.sh                     # CI rubocop script (diffs against master)
```

### Database Commands
```bash
bundle exec rails db:migrate       # Run pending migrations
bundle exec rails db:rollback      # Rollback last migration
bundle exec rails db:seed          # Seed database
bundle exec rails db:reset         # Drop, create, migrate, seed
```

## Code Style Guidelines

### General Ruby Style
1. **Frozen String Literal:** Every Ruby file MUST start with `# frozen_string_literal: true`
2. **Line Length:** Maximum 120 characters per line
3. **Method Length:** Maximum 30 lines per method
4. **ABC Size:** Maximum complexity score of 20

### Formatting
- **Hash Alignment:** Use table style alignment for readability
- **Block Braces:** No space inside block braces: `items.each {|item| process(item)}`
- **Hash Literal Braces:** No space inside: `{key: value}`
- **Symbol Arrays:** Use `%i[]` syntax: `before_action :set_post, only: %i[edit update destroy]`

### Naming Conventions
| Element | Convention | Example |
|---------|------------|---------|
| Classes/Modules | PascalCase | `PostsController`, `ApplicationHelper` |
| Methods | snake_case | `set_post`, `normalize_friendly_id` |
| Variables | snake_case | `popular_posts`, `error_trace` |
| Constants | SCREAMING_SNAKE_CASE | `VIETNAMESE_CONVERT_TABLE` |
| Files | snake_case | `posts_controller.rb`, `slack_notifier.rb` |

### Controller Structure
```ruby
# frozen_string_literal: true
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  
  def index; end
  def show; end
  def create; end
  def update; end
  def destroy; end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
```

### Model Structure
```ruby
# frozen_string_literal: true
class Post < ApplicationRecord
  include VietnameseService       # Includes/Extends first
  extend FriendlyId
  
  has_many :comments              # Associations
  belongs_to :user
  
  scope :published, -> {where(published: true)}  # Scopes
  validates :title, presence: true  # Validations
  # Instance methods last
end
```

### Error Handling
Use `rescue_from` in controllers for global error handling. Re-raise errors in development for debugging. Use Rollbar for production error tracking.

```ruby
rescue_from StandardError do |e|
  raise e if Rails.env.development?
  e.is_a?(ActiveRecord::RecordNotFound) ? render_error_page(404) : (render_error_page(500); Rollbar.error(e))
end
```

### Testing Patterns (RSpec)
```ruby
# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before { get posts_path }
    
    it 'returns http success' do
      expect(response).to have_http_status(200)
    end
  end
end
```

## Project Structure
```
app/
  controllers/      # Request handlers (public & admin namespaces)
  models/           # ActiveRecord models
  views/            # ERB templates
  helpers/          # View helper methods
  javascript/       # Vue.js components (Webpacker)
  uploaders/        # CarrierWave file upload handlers
config/             # Application configuration
db/                 # Migrations and schema
lib/                # Custom libraries (SlackNotifier, VietnameseService)
spec/requests/      # Request/integration specs
```

## Key Dependencies
- **Authentication:** Devise
- **Friendly URLs:** FriendlyId
- **Markdown:** Redcarpet + CodeRay
- **File Uploads:** CarrierWave
- **Search:** Ransack
- **Pagination:** Kaminari
- **Error Tracking:** Rollbar

## CI/CD
- CircleCI runs RuboCop and RSpec on each push
- Tests require PostgreSQL 10.6+
- Ruby 2.5.3 in CI environment

## Common Pitfalls
1. Always run `bundle exec` before Rails/Rake commands
2. Run `yarn install` after pulling if `yarn.lock` changed
3. Migrations must be run before tests: `bundle exec rails db:migrate RAILS_ENV=test`
4. Admin routes are namespaced under `/admin`
5. Use `friendly_id` for Post lookups, not raw IDs
