require 'ffaker'

5.times do
  name = FFaker::Product.product,
  description = FFaker::HipsterIpsum.paragraph

  puts name
  puts description
end
