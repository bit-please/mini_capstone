class Api::ProductsController < ApplicationController

	def all_products_action
		@products = Product.all #returns an array of product hashes
		render 'all_products.json.jbuilder'
	end

	def first_product_method
		@product = Product.first #a hash of product data
		render 'first_product.json.jbuilder'
	end

	def second_product_method
		@product = Product.second #a hash of product data
		render 'second_product.json.jbuilder'
	end

	def sixth_product_method
		@product = Product.find_by(id: 6) #a hash of product data
		render 'second_product.json.jbuilder'
	end

end
