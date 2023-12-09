class Wedding
	attr_reader :guests, :flowers, :songs
	def prepare(preparers)
		preparers.each do |preparer|
      p self
      p preparer
      p "----"
			preparer.prepare_wedding(self) # self refers to an instance of the class
		end
	end
end

class Chef
	def prepare_wedding(wedding)
		prepare_food(wedding.guests) # calling the #guests getter method
	end

	def prepare_food(guests); end
end

class Decorator
	def prepare_wedding(wedding)
		decorate_place(wedding.flowers)
	end

	def decorate_place(flowers); end
end

class Musician
	def prepare_wedding(wedding)
		prepare_performance(wedding.songs)
	end

	def prepare_performance(songs); end
end

######
wedding1 = Wedding.new
wedding1_preparers = [Chef.new, Decorator.new, Musician.new]
wedding1.prepare(wedding1_preparers)

wedding2 = Wedding.new
wedding2_preparers = [Chef.new]
wedding2.prepare(wedding2_preparers)