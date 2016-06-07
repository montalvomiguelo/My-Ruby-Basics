# Module as container of other classes in order to avoid confilcts with other classes that are same name
module LaserBots
  module Console
    class Command
    end
  end

  module World
    class Player
      attr_reader :name
      def initialize(name)
        @name = name
      end
    end
  end
end

# Again to access inside module :: constant resolution operator
player = LaserBots::World::Player.new("Jason")
puts player.name
