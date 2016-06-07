Player = Struct.new(:name, :progress)

kim = Player.new("Kim")
kim.progress = 10

# puts kim.inspect

# kim object to string
kim_out = Marshal.dump(kim)
puts kim_out.inspect

# load kim data from above string
kim_clone = Marshal.load(kim_out)
puts kim_clone.inspect
