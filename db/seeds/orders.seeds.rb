user_ids = User.pluck(:id)
customer_ids = Customer.pluck(:id)
status = [:pending, :on_way, :on_door, :done]

200.times do
  Order.create!(
    description: Faker::Lorem.paragraphs[0], 
    customer_id: customer_ids.sample,
    created_by_id: user_ids.sample,
    status: status.sample
  )
end

