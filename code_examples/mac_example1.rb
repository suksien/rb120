class Account
	attr_reader :username

	def initialize(username, password, ssn)
		@username = username
		@password = password
    @ssn = ssn
	end

	def same_ssn?(other_person)
		ssn == other_person.ssn
	end

	private

	attr_reader :password

	protected
	
	attr_reader :ssn

end

jane = Account.new('jane123', 'abc', 123456789)
amy = Account.new('amy789', 'xxx', 123456789)

p jane.username
jane.ssn # NoMethodError
jane.password # NoMethodError

p jane.same_ssn?(amy) #=> true
