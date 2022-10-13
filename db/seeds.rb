# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


5.times do |n|
	User.create!(
		name: "user#{n + 1}",
		email: "user#{n + 1}@user.com",
		password: "password123",
		phone_number: 1123456789
	)
end

5.times do |n|
	Admin.create!(
		admin_number: 7.times.map { rand(9) }.join,
		email: "test#{n + 1}@test.com",
		password: "password123"
	)
end

5.times do |n|
	Product.create!(
		product: "product#{n + 1}",
		product_description: "product#{n + 1}です",
		product_price: "#{n + 1}00",
		product_quantity: "#{n + 1}"
	)
end

5.times do |n|
	Address.create!(
		user_id: n + 1,
		zip: 1234567,
		address: "北海道札幌市北区北#{n + 1}条西#{n + 1}丁目",
	)
end
