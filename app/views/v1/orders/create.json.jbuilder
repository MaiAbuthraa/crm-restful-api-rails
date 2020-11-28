json.id @order.id
json.status @order.status
json.description @order.description
json.active @order.active

json.partial! "v1/users/admin.json.jbuilder", resource: @order
