module Tracking
  def instances
    @instances ||= []
  end

  # class method (extend keyword)
  def create(name)
    object = new(name)
    @instances.push(object)
    object
  end

  # class method (extend keyword)
  def find(name)
    instances.find { |instance| instance.name == (name) }
  end
end

class Customer
  extend Tracking

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "[#{@name}]"
  end
end

# using class methods
puts Customer.instances.inspect
Customer.create("Jason")
Customer.create("Miguelo")
Customer.create("Hugo")
puts Customer.instances.inspect
puts Customer.find("Jason")
