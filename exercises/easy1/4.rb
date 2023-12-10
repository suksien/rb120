=begin
Complete this program so that it produces the expected output:

The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.
=end

class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin

Further Exploration
What do you think of this way of creating and initializing Book objects?
(The two steps are separate.) 

Would it be better to create and initialize at the same time like in the previous exercise? 
What potential problems, if any, are introduced by separating the steps?

- create and initialize at the same time prevents one from forgetting to define the mandatory
attributes of the object (in this case, it would be the `author` and `title` of the `book`), which 
will result in `nil` being assigned to the instance variables. Calling any methods on the `nil`
values will cause unexpected behaviors. 

=end