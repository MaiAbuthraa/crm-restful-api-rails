user_ids = User.pluck(:id)
customer_ids = Customer.pluck(:id)

200.times do
  puts Contact.create!(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    customer_id: customer_ids.sample,
    created_by_id: user_ids.sample
  )
end

