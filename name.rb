class Name
  # Attribute Readers
  # Allows us to acces avariables in a class from outside that class.
  # attr_reader :title, :first_name, :middle_name, :last_name

  # Allows us to reset the value of instance variables
  # attr_writer :title

  # Attributer reader and writer (2 in 1)
  # attr_accesor :title

  attr_accessor :title, :first_name, :middle_name, :last_name

  # Initialize
  # Gets run when we instantiate an object of this class
  def initialize(title, first_name, middle_name, last_name)
    # Instance variable
    # Is available to each method in the class
    @title = title
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    return "#{@title} #{@first_name} #{@middle_name} #{@last_name}"
  end

  # Override the method to s
  def to_s
    full_name()
  end
end

name = Name.new("Mr.", "Montalvo", "", "Miguelo")
nick = Name.new("Mr.", "Nick", "", "Pettit")
name.title = "Dr"
puts name
puts nick
