if current_user.admin?
  json.set! :created_by do
    json.id resource.created_by_id
    json.is_admin resource.created_by.is_admin
    json.email resource.created_by.email
  end 
end
