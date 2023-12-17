module Walkable
  def walk
    "#{get_name} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_name
    "#{name}"
  end

  private
  def gait
    "strolls"
  end
end

class Noble
  include Walkable
  attr_reader :name, :title
  def initialize(name, title)
    @name = name
    @title = title
  end

  def get_name
    "#{title} #{name}"
  end
  
  private
  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk # => "Lord Byron struts forward"
p byron.name # => "Byron"
p byron.title # => "Lord"

mike = Person.new("Mike")
p mike.walk # => "Mike strolls forward"
