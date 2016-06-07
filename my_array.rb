class MyArray
  attr_reader :array

  def initialize
    @array = []
  end

  def push(item)
    array.push(item)
  end

  def for_each
    for item in array
      yield item
    end
    array
  end
end

my_array = MyArray.new

my_array.push('uno')
my_array.push('dos')
my_array.push('tres')

puts my_array.for_each {|item| puts "Item: #{item}"}

