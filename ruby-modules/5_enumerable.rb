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
    @score = score
  end

end

class Game
  include Enumerable

  attr_accessor :players

  def each(&block)
    players.each(&block)
  end

  def initialize
    @players = []
  end

  def add_player(player)
    players.push(player)
  end
end

player1 = Player.new("Jason", 100)
player2 = Player.new("Kenneth", 80)
player3 = Player.new("Nick", 95)
player4 = Player.new("Craig", 20)

game1 = Game.new
game1.add_player(player1)
game1.add_player(player2)

game2 = Game.new
game2.add_player(player3)
game2.add_player(player4)

puts game1.players.inspect
game1.each { |player| puts "[Name: #{player.name}, Score: #{player.score}]" }
puts game1.any? { |player| player.score > 80 }
puts game1.find { |player| player.score > 80 }.inspect
