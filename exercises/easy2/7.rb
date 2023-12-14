=begin

Write the classes and methods that will be necessary to make this code run, 
and print the following output:

=end

class Pet
  attr_accessor :type, :name
  def initialize(type, name)
    self.type = type
    self.name = name
  end
end

class Owner
  attr_accessor :name, :animals
  def initialize(name)
    self.name = name
    self.animals = []
  end

  def adopt(animal)
    self.animals << animal
  end

  def number_of_pets
    self.animals.size
  end
end

class Shelter
  @@owners = []

  def adopt(person, animal) # person and animal are "collaborator objects" for Shelter
    @@owners << person unless @@owners.include?(person)
    person.adopt(animal)
  end

  def print_adoptions
    @@owners.each do |owner|
      pets = owner.animals
      puts "#{owner.name} has adopted the following pets:"
      pets.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
      puts "\n"
    end
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."