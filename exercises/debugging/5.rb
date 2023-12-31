class File
  attr_accessor :name, :byte_content
  
  def initialize(name)
    @name = name
  end

  alias_method :read,  :byte_content
  alias_method :write, :byte_content=

  def copy(target_file_name)
    target_file = self.class.new(target_file_name)
    target_file.write(read)

    target_file
  end

  def to_s
    "#{name}.#{self.class::FORMAT}" # "#{name}.#{FORMAT}"
  end
end

class MarkdownFile < File
  FORMAT = :md
end

class VectorGraphicsFile < File
  FORMAT = :svg
end

class MP3File < File
  FORMAT = :mp3
end

# Test

blog_post = MarkdownFile.new('Adventures_in_OOP_Land')
blog_post.write('Content will be added soon!'.bytes)

copy_of_blog_post = blog_post.copy('Same_Adventures_in_OOP_Land')

puts copy_of_blog_post.is_a? MarkdownFile     # true
puts copy_of_blog_post.read == blog_post.read # true

puts blog_post

=begin
When `puts` is called on line 45, it automatically calls the custom `to_s` method 
defined on line 18. However, a `NameError` is raised because the `FORMAT` constant
variable on line 19 is not found within the `File` class, the inheritance chain of the
`File` class, nor the top-level main scope. 

Even though the `FORMAT` is defined on line 24 of the `MarkdownFile` class, for which 
`blog_post` belongs, the `to_s` method is invoked from the `File` class, which is a superclass
of `MarkdownFile`. When Ruby tries to resolve the constant refernce in the superclass, it first
searches lexically of the reference and then up the inheritance chain of the class.

To fix it, we can use a namespace resolution operator invoked on `self.class` to tell Ruby 
where to search for the constant.

=end