# library.rb
require_relative 'book'

class Library
  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def list_books
    @books.each { |book| puts book }
  end

  def find_book(title)
    @books.find { |book| book.title.downcase == title.downcase }
  end

  def borrow_book(title)
    book = find_book(title)
    if book&.borrow
      puts "#{book.title} has been borrowed."
    else
      puts "Book not available or doesn't exist."
    end
  end

  def return_book(title)
    book = find_book(title)
    if book
      book.return_book
      puts "#{book.title} has been returned."
    else
      puts "Book doesn't exist."
    end
  end
end
