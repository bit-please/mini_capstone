class Api::ProductsController < ApplicationController

	def all_products_action
		@products = Product.all #returns an array of product hashes
		render 'all_products.json.jbuilder'
	end

	def first_product_method
		@product = Product.first #a hash of product data
		render 'first_product.json.jbuilder'
	end

	def one_product
		product_id = params[:id]
		@product = Product.find_by(id: product_id) #a hash of product data
		render 'one_product.json.jbuilder'
	end

end
