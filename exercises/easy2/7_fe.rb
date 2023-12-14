=begin

Suppose the shelter has a number of not-yet-adopted pets, and wants to manage them through this 
same system. Thus, you should be able to add the following output to the example output shown above:

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
  attr_accessor :owners, :animals
  def initialize
    @owners = []
    @animals = []
  end

  def add_new_animal(animal)
    self.animals << animal
  end

  def number_of_available_pets
    animals.size
  end

  def adopt(person, animal) # person and animal are "collaborator objects" for Shelter
    if animals.include?(animal)
      self.owners << person unless owners.include?(person)
      person.adopt(animal)
      self.animals.delete(animal)
    end
  end

  def print_adoptions
    @owners.each do |owner|
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

shelter = Shelter.new
shelter.add_new_animal(butterscotch)
shelter.add_new_animal(pudding)
shelter.add_new_animal(darwin)
shelter.add_new_animal(kennedy)
shelter.add_new_animal(sweetie)

puts "Shelter currently has #{shelter.number_of_available_pets} available animals."
puts "\n"

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter.adopt(phanson, butterscotch)
shelter.adopt(bholmes, pudding)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, kennedy)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

puts "Shelter currently has #{shelter.number_of_available_pets} available animals."
puts "\n"