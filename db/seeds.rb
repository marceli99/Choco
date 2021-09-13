user = User.new
user.email = 'test@test.com'
user.password = 'test'
user.password_confirmation = 'test'
user.save!

post = Post.new
post.content = IO.binread("./db/files/post.txt")
post.created_at = DateTime.new(2020, 12, 31, 21, 15)
post.title = 'Test #1'
post.save!