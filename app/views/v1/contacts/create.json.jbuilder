json.name @contact.name
json.phone @contact.phone
json.email @contact.email

json.partial! "v1/users/admin.json.jbuilder", resource: @contact
