class Monster
  attr_reader :name, :actions

  def initialize(name)
    @name = name
    @actions = {
      :screams => 0
    }
  end

  def say(&block)
    puts "#{name} says: "
    # self is the instance of the monster
    yield self if block_given?
  end

  def scream
    actions[:screams] += 1
    puts "#{name} screams!"
    yield
  end

  def print_scoreboard
    puts "-" * 10
    puts "#{name} Scoreborad"
    puts "-" * 10
    puts "- Screams: #{actions[:screams]}"
    puts "-" * 10
  end

end

miguelo = Monster.new("Miguelo")

miguelo.say do |monster|
  puts "Hello I'm cool & sexy"
  puts monster.inspect
end

miguelo.scream { puts "Muajajaja" }

miguelo.print_scoreboard
