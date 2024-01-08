# polymorphism via class inheritance and mixin module 
# in progress

module 

class Meal
	def initialize(portion)
		@portion = portion
	end

	def prepare
	end

	def serve
	end
end

class Breakfast < Meal
	def make_coffee
	end
end

class Lunch < Meal
	def make_sandwich
	end
end

class Dinner < Meal
	def make_pasta
	end
end