class Person
	attr_reader :first_name

	def initialize(first_name, last_name, ssn)
		@first_name = first_name
		@last_name = last_name
		@ssn = ssn
	end

	def same_last_name?(other_person)
		last_name == other_person.last_name
	end

	private

	attr_reader :ssn

	protected
	
	attr_reader :last_name

end

jane = Person.new('Jane', 'Doe', 123456789)
amy = Person.new('Amy', 'Doe', 223456789)

jane.first_name # => "Jane"
jane.ssn # NoMethodError
jane.last_name # NoMethodError

jane.same_last_name?(amy) #=> true
