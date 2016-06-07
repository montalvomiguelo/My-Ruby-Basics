# In order to use JSON class we have explicitly required
require 'net/http'

uri = URI('http://montalvomiguelo.com')
res = puts Net::HTTP.get(uri)

puts res.body
