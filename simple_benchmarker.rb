class SimpleBenchmarker
  def run
    start_time = Time.now
    yield
    end_time = Time.now
    elapsed = end_time - start_time
    puts "Elapsed time: #{elapsed}"
  end
end

benchmarker = SimpleBenchmarker.new

benchmarker.run do
  #100.times { 100 * 1000 }
  5.times do
    sleep(rand(0.1..1.0))
  end
end
