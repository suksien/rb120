=begin

Given the following code...:

# bob = Person.new
# bob.hi

And the corresponding error message...

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how would you go about fixing it?

=end

# The error is raised because one is trying to invoke the private `hi`  method on an object 
# on line 6. By definition, private method is only available within the class and not outside
# of it. 

# To fix it, we can make the `hi` method public instead by removing the `private` method
# call before the `hi` method definition in the class, or moving the `hi` method before the 
# `private` method call. 