class Api::ProductsController < ApplicationController

	def index
		@products = Product.all 
		render 'index.json.jbuilder'
	end

	def show
		product_id = params[:id]
		@product = Product.find_by(id: product_id) #a hash of product data
		render 'show.json.jbuilder'
	end

	def create
		@product = Product.new(
			name: params[:name],
			price: params[:price],
			image_url: params[:image_url],
			description: params[:description]
		)
		@product.save
		render 'show.json.jbuilder'
	end

	def update
		@product = Product.find(params[:id])

		@product.name = params[:name] || @product.name
		@product.price = params[:price] || @product.price
		@product.image_url = params[:image_url] || @product.image_url
		@product.description = params[:description] || @product.description

		@product.save
		render 'show.json.jbuilder'
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		render json: {message: "Product successfully destroyed!"}
	end

end
