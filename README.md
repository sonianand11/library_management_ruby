# Library Management System

This is a simple Library Management System written in Ruby. The application allows you to manage a collection of books, including adding new books, borrowing books, returning books, and listing all books in the library.

## Features

- **Add a book**: Add new books to the library.
- **List books**: List all books available in the library.
- **Find a book**: Find a book by its title.
- **Borrow a book**: Borrow a book from the library if it is available.
- **Return a book**: Return a borrowed book to the library.

## Concepts Covered

- **Classes and Objects**: The application uses classes like `Book` and `Library` to encapsulate the behavior and data related to the library system.
- **Instance Variables and Methods**: The use of instance variables to store the state of objects, and instance methods to define behavior.
- **Metaprogramming**: Dynamic method handling using `method_missing` and `respond_to_missing?` (conceptually introduced in the extended examples).
- **Testing with RSpec**: Writing and executing unit tests using RSpec.
- **Basic File Structure**: Organizing code in separate files and using `require_relative` to include them.
- **Conditionals**: Using `if` statements to control the flow of the program.
- **Iterators and Enumerables**: Using methods like `each` to iterate over collections.

## Prerequisites

- Ruby (version 2.6 or higher)
- Bundler (optional, for managing dependencies)
- SQLite3 (for advanced ORM functionality)

## Getting Started

1. **Clone the repository**:
```bash
git clone https://github.com/sonianand11/library_management_ruby.git
cd library_management_ruby
```
2. **Install RSpec (if not already installed)**:
```bash
gem install rspec
```

3. **Set up the database (if using the ORM example)**:
```ruby
ruby setup_database.rb
```

4. **Run the application:** 
You can create an interactive Ruby session or create a main.rb script to interact with the library.
```ruby
ruby main.rb
```

**Example usage:**

```ruby
library = Library.new
book = Book.new("The Great Gatsby", "F. Scott Fitzgerald")
library.add_book(book)
library.list_books
library.borrow_book("The Great Gatsby")
library.return_book("The Great Gatsby")
```

## Running Tests
  The application uses RSpec for testing. To run the tests, follow these steps:

**Run all tests:**

    rspec

**Run a specific test file:**

    rspec spec/book_spec.rb

**Run a specific test example: Use the --example flag to run a specific test example:**

    rspec --example "returns a string representation of the book"

**File Structure**
```
library-management-system/
│
├── book.rb            # Contains the Book class
├── library.rb         # Contains the Library class
├── setup_database.rb  # Sets up the SQLite database (optional, for ORM)
├── main.rb            # Example script to run the library management system
│
├── spec/              # Directory containing all RSpec tests
│   ├── book_spec.rb   # Tests for the Book class
│   └── library_spec.rb# Tests for the Library class
│
└── README.md          # This README file
```

**Future Enhancements**

- **Extend functionality:** Add more features like search by author, book ratings, etc.
- **User management:** Implement a user system to track who has borrowed which book.
- **Persistent storage:** Use a database to persist the state of the library.

## Contributions

Contributions are welcome! Please fork this repository and submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
