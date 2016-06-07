def block_method
  puts "This is the first line in the block_method"
  # the block content
  yield
end

# Send a block into block_method
block_method do
  "This is statement is called from the block"
end

block_method
