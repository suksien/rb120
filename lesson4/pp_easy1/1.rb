# Which of the following are objects in Ruby? If they are objects, 
#how can you find out what class they belong to?

# they are all objects:

true                    # boolean object
"hello"                 # string object
[1, 2, 3, "happy days"] # array object
142                     # integer object

# class the #class method on the object to reveal their class name
p true.class # TrueClass
p "hello".class
p [1, 2, 3, "happy days"].class
p 142.class