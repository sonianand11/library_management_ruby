# book.rb
class Book
  attr_accessor :title, :author, :available

  def initialize(title, author)
    @title = title
    @author = author
    @available = true
  end

  def borrow
    if available
      self.available = false
      true
    else
      false
    end
  end

  def return_book
    self.available = true
  end

  def to_s
    "#{title} by #{author} - #{available ? 'Available' : 'Borrowed'}"
  end
end
