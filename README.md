### Tests and linter status:
[![Ruby on Rails CI](https://github.com/khamitskiy-vlad/rails-project-64/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/khamitskiy-vlad/rails-project-64/actions/workflows/rubyonrails.yml)

### DigiBash - collective blog
https://digibash.onrender.com/

This is a Ruby on Rails application that allows multiple users to create, edit, and manage blog posts with nested comments.

## Technologies
- **Ruby**: 3.2.2
- **Rails**: 7.1
- **Views**: Slim
- **UI framework**: Bootstrap
- **Database**: PostgreSQL (production), SQLite (development and testing)
- **Authorization**: Devise
- **Comments** (nested): Ancestry
- **Pagination**: Pagy
- **Search**: Ransack
- **Testing**: Minitest
- **Internationalized** (Rus, Eng): I18n

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/khamitskiy-vlad/rails-collective-blog.git
   cd rails-collective-blog
   ```

2. Install dependencies:
   ```bash
   bundle
   ```

3. Set up the database:
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   ```
   Development and test environments use SQLite, production uses PostgreSQL.

5. Start the server:
   ```bash
   bin/rails s
   ```

6. Open the app in your browser:
   ```
   http://localhost:3000
   ```

## Testing

Run the test suite:
```bash
bin/rails test
```

## Contributing

Feel free to submit issues or contribute by making a pull request.
