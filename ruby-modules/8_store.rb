module Inventoryable
  # when a class include this module, extend in that class ClassMethods module as well
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def instances
      @instances ||= []
    end

    def create(attributes)
      object = new(attributes)
      instances.push(object)
      object
    end

    def in_stock_report
      instances.select { |instance| instance.in_stock? }
    end
  end

  # getter for stock_count instance variable
  def stock_count
    # current value or initialize in 0
    @stock_count ||= 0
  end

  # setter for stock_count instance variable
  def stock_count=(number)
    @stock_count = number
  end

  def in_stock?
    stock_count > 0
  end
end

# Namespace for our classes
module Treehouse
  class Shirt
    include Inventoryable
    # Can be extended via extend keyword also
    #extend Inventoryable::ClassMethods

    attr_accessor :attributes

    def initialize(attributes)
      @attributes = attributes
    end
  end
end

green_shirt = Treehouse::Shirt.create(name: "Green Mike", size: "S")
green_shirt.stock_count

pink_shirt = Treehouse::Shirt.create(name: "Pink Mike", size: "S")
pink_shirt.stock_count = 4

purple_shit = Treehouse::Shirt.create(name: "Purple Frog", size: "M")
purple_shit.stock_count = 1

puts Treehouse::Shirt.in_stock_report.inspect
