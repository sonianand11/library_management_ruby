# main.rb
require_relative 'library'

class LibraryApp
  def initialize
    @library = Library.new
  end

  def start
    loop do
      puts "\nWelcome to the Library"
      puts "1. Add Book"
      puts "2. View All Books"
      puts "3. Borrow Book"
      puts "4. Return Book"
      puts "5. Exit"
      print "Choose an option: "
      choice = gets.chomp.to_i

      case choice
      when 1
        add_book
      when 2
        view_books
      when 3
        borrow_book
      when 4
        return_book
      when 5
        puts "Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  private

  def add_book
    print "Enter book title: "
    title = gets.chomp
    print "Enter book author: "
    author = gets.chomp
    book = Book.new(title, author)
    @library.add_book(book)
    puts "Book added successfully."
  end

  def view_books
    @library.list_books
  end

  def borrow_book
    print "Enter book title to borrow: "
    title = gets.chomp
    @library.borrow_book(title)
  end

  def return_book
    print "Enter book title to return: "
    title = gets.chomp
    @library.return_book(title)
  end
end

# Start the application
LibraryApp.new.start
