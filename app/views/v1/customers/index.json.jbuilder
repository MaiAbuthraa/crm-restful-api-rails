json.array! @customers do |customer|
  json.id customer.id
  json.name customer.name
  json.company_name customer.company_name
  json.category customer.category
  json.active customer.active

  json.partial! "v1/users/admin.json.jbuilder", resource: customer
end
