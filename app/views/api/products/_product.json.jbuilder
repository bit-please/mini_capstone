json.id product.id
json.name product.name
json.price product.price
json.description product.description
json.discounted product.is_discounted?
json.supplier_name product.supplier.name
json.images product.images
json.category_names product.category_names

json.formatted do
	json.price number_to_currency(product.price)
	json.tax number_to_currency(product.tax)
	json.total number_to_currency(product.total)
end