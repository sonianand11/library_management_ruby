require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new("The Great Gatsby", "F. Scott Fitzgerald") }

  describe "#initialize" do
    it "assigns a title and author" do
      expect(book.title).to eq("The Great Gatsby")
      expect(book.author).to eq("F. Scott Fitzgerald")
    end

    it "is available by default" do
      expect(book.available).to be true
    end
  end

  describe "#borrow" do
    context "when the book is available" do
      it "marks the book as borrowed" do
        book.borrow
        expect(book.available).to be false
      end

      it "returns true" do
        expect(book.borrow).to be true
      end
    end

    context "when the book is not available" do
      before { book.borrow }

      it "does not change availability" do
        expect { book.borrow }.not_to change(book, :available)
      end

      it "returns false" do
        expect(book.borrow).to be false
      end
    end
  end

  describe "#return_book" do
    before { book.borrow }

    it "marks the book as available" do
      book.return_book
      expect(book.available).to be true
    end
  end

  describe "#to_s" do
    it "returns a string representation of the book" do
      expect(book.to_s).to eq("The Great Gatsby by F. Scott Fitzgerald - Available")
    end
  end
end
