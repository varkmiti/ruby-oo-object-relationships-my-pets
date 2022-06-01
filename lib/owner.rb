class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.count 
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def self.all
    @@all
  end

  def cats 
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs 
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.each { |dog| dog.mood = "nervous" ; dog.owner = nil }
    cats.each { |cat| cat.mood = "nervous" ; cat.owner = nil }
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end