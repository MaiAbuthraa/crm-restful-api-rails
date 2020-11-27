json.array! @contacts do |contact|
  json.name contact.name
  json.phone contact.phone
  json.email contact.email

  if current_user.admin?
    json.set! :created_by do
      json.id contact.created_by_id
      json.is_admin contact.created_by.is_admin
      json.email contact.created_by.email
    end 
  end
end
