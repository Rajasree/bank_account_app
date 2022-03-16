# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@first_user = User.new(email: "dummy_first_user@gmail.com")
@first_user.save(validate: false)
(101..105).each do |i|
	u = User.new(email: "fdsfdsfdsf#{i}@gmail.com")
	u.save(validate: false)
	n = Nominee.new(user_id: @first_user.id, nominee_id: u.id, weightage: 20)
  n.save(validate: false)
end