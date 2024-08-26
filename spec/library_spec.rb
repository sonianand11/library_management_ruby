require_relative '../library'
require_relative '../book'
require 'pry-byebug'

RSpec.describe Library do
  let(:library) { Library.new }
  let(:book) { Book.new("The Great Gatsby", "F. Scott Fitzgerald") }

  describe "#add_book" do
    it "adds a book to the library" do
      library.add_book(book)
      expect(library.instance_variable_get(:@books)).to include(book)
    end
  end

  describe "#list_books" do
    before { library.add_book(book) }

    it "lists all books in the library" do
      expect { library.list_books }.to output("The Great Gatsby by F. Scott Fitzgerald - Available\n").to_stdout
    end
  end

  describe "#find_book" do
    before { library.add_book(book) }

    it "finds a book by title" do
      expect(library.find_book("The Great Gatsby")).to eq(book)
    end

    it "returns nil if the book is not found" do
      expect(library.find_book("Moby Dick")).to be_nil
    end
  end

  describe "#borrow_book" do
    before { library.add_book(book) }

    context "when the book is available" do
      it "borrows the book" do
        expect(book.available).to eq(true)
        expect { library.borrow_book("The Great Gatsby") }.to output("The Great Gatsby has been borrowed.\n").to_stdout
        expect(book.available).to eq(false)
      end
    end

    context "when the book is not available" do
      before { book.borrow }

      it "does not borrow the book" do
        expect { library.borrow_book("The Great Gatsby") }.to output("Book not available or doesn't exist.\n").to_stdout
      end
    end
  end

  describe "#return_book" do
    before { library.add_book(book) }

    context "when the book is borrowed" do
      before { book.borrow }

      it "returns the book" do
        expect { library.return_book("The Great Gatsby") }.to change { book.available }.from(false).to(true)
        expect { library.return_book("The Great Gatsby") }.to output("The Great Gatsby has been returned.\n").to_stdout
      end
    end

    context "when the book doesn't exist" do
      it "prints an error message" do
        expect { library.return_book("Moby Dick") }.to output("Book doesn't exist.\n").to_stdout
      end
    end
  end
end
