class ProductsController < ApplicationController
	def index
		@products = Product.all
		render 'index.html.erb'
	end

	def new
		render 'new.html.erb'
	end

	def create
		@product = Product.new(
			name: params[:name],
			price: params[:price],
			description: params[:description],
			supplier_id: params[:supplier_id]
		)
		if @product.save
			Image.create(
				url: params[:image_url],
				product_id: @product.id
			)
		end
		redirect_to "/products/#{@product.id}"
	end

	def show
		@product = Product.find(params[:id])
		render 'show.html.erb'
	end

	def edit
		@product = Product.find(params[:id])
		render 'edit.html.erb'
	end

	def update
		@product = Product.find(params[:id])

		@product.name = params[:name]
		@product.price = params[:price]  
		@product.description = params[:description] 
		@product.supplier_id = params[:supplier_id] 

		@product.save
		redirect_to "/products/#{@product.id}"
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to "/products"
	end
end
