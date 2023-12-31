class AuthenticationError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY)
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY)
      (positive * 100) / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)
    case score
    when NoScore
      "No idea about #{term}..."
    when 0...40
      "#{term} is not fun."
    when 40...60
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

=begin
The return value of calling `Score::for_term` method on line 38 is a NoScore class.
On line 39 to 48 we have a series of case statements that implicitly call the `===`
method to compare the value of `score` with each value of the `when` clauses. As such, 
line 40 is equivalent to `NoScore === score`. Since `NoScore` is a class, this boils down to
checking if `score` is an instance of `NoScore` class. However, since `value` has the value 
of a class, line 40 evaluates to false and the else branch on line 46 is executed.

The second problem is the error message is never printed for a non-valid `API_KEY` value.
This is because the `Score::for_term` method rescues the exception on lines 31 - 33 before
the exception reaches the `find_out` method.

=end
