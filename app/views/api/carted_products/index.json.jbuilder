json.array! @carted_products.each do |carted_product|
	json.partial! "carted_product.json.jbuilder", carted_product: carted_product
end