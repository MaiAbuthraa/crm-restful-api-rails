puts "Seed Users"

10.times do
  User.create(
    email: Faker::Internet.email,
    password: "123456", # this bad way
  )
end
