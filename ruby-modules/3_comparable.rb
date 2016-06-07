# Ruby Core Modules

class Player
  # The Comparable module allows you to make your classes sortable
  include Comparable

  attr_accessor :name, :score

  # The class mus define the <=> operator, which compared the receiver against another object
  # Returns:
  # -1 for <
  # 0 for ==
  # +1 for >
  def <=>(other)
    score <=> other.score
  end

  def initialize(name, score)
    @name = name
    @store = score
  end
end

player1 = Player.new("Jason", 100)
player2 = Player.new("Kenneth", 80)

puts player1 < player2
