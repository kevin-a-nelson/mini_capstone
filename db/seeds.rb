# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(name: 'Green Light Saber', price: 20, image_url: 'https://images-na.ssl-images-amazon.com/images/I/31MceNp9uzL._SX425_.jpg', description: 'a cool green lightsaber')

product.save
