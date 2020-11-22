user_ids = User.pluck(:id)

30.times do
  Customer.create(
    name: Faker::Name.name,
    company_name: Faker::Company.bs,
    created_by_id: user_ids.sample,
    category: rand(3)
  )
end

