# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.email = 'admin@admin.admin'
user.password = 'zaq1@WSX'
user.password_confirmation = 'zaq1@WSX'
user.save!

post = Post.new
post.content = 'Test #1'
post.created_at = DateTime.new(2021, 1, 1, 0, 0)
post.title = 'Test #1'
post.save!