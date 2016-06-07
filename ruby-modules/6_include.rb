module Fetcher
  # Each time it's included into a class, this method is fired
  # It's a class method
  def self.included(klass)
    attr_accessor :fetch_count
  end
  def fetch(item)
    @fetch_count ||= 0
    @fetch_count += 1
    puts "[#{@name}, Fetch Count: #{@fetch_count}] I'll brint that #{item} right back!"
  end
end

class Dog
  include Fetcher
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

fido = Dog.new("Fido")
fido.fetch("ball")
fido.fetch("yeii")

fido = Dog.new("Nibi")
fido.fetch("azul")
fido.fetch("verde")
