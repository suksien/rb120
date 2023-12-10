=begin

Complete this class so that the test cases shown below work as intended. 
You are free to add any methods or instance variables you need. 
However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

=end

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-" + "-" * @message.size + "-+"
  end

  def empty_line
    "| " + " " * @message.size + " |"
  end

  def message_line
    "| #{@message} |"
  end
end

# test cases
banner = Banner.new('To boldly go where no one has gone before.')
#puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
#puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

=begin
Further Exploration
Modify this class so new will optionally let you specify a fixed banner width at the time 
the Banner object is created. The message in the banner should be centered within the banner of 
that width. Decide for yourself how you want to handle widths that are either too narrow or 
too wide.

=end

class Banner
  MIN_PAD, MAX_PAD = 2, 20

  def initialize(message, width=nil)
    @message = message
    @width = check_width(width)
  end

  def check_width(width)
    min_width, max_width = @message.size + MIN_PAD, @message.size + MAX_PAD
    txt = (width < min_width ? "narrow" : "wide")
    if width < min_width || width > max_width
      puts "The width is too #{txt}.. setting the width to be length of message"
      @width = @message.size + 2
    else
      @width = width
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-" + "-" * @width + "-+"
  end

  def empty_line
    "| " + " " * @width + " |"
  end

  def message_line
    "| " + @message.center(@width) + " |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 49)
puts banner

banner = Banner.new('', 10)
puts banner