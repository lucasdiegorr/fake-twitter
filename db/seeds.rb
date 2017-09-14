#Usuarios
User.create!({
  first_name: 'Admin',
  last_name: 'Admin',
  email: 'admin@admin.com',
  admin: true,
  password: '123mudar',
  password_confirmation: '123mudar',
})

10.times do |index|
	User.create!({
	  first_name: Faker::Name.name,
	  last_name: Faker::Name.name,
	  email: Faker::Internet.email,
	  password: '123mudar',
	  password_confirmation: '123mudar',
	})	
end

User.all.each do |user|
	rand(1..30).times do |index|
		Post.create!({
			user: user,
			content: Faker::Lorem.paragraph
		})
	end
end