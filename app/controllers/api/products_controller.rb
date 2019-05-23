class Api::ProductsController < ApplicationController

	before_action :authenticate_admin, except: [:index, :show]

	def index
		@products = Product.all.order(:id)

		if params[:search]
			@products = @products.where("name iLIKE ?", "%#{params[:search]}%")
		end

		if params[:discount]
			@products = @products.where("price < ?", 10)
		end

		if params[:sort] == "price"
			if params[:sort_order] == "desc"
				@products = @products.order(price: :desc)
			else
				@products = @products.order(:price)
			end
		end

		if params[:category]
			category = Category.find_by(name: params[:category])
			@products = category.products
		end

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
			description: params[:description]
		)
		if @product.save
			# create a new image
			Image.create(url: params[:image_url], product_id: @product.id)
			render 'show.json.jbuilder'
		else
			# sad path
			render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def update
		@product = Product.find(params[:id])

		@product.name = params[:name] || @product.name
		@product.price = params[:price] || @product.price
		@product.description = params[:description] || @product.description

		if @product.save
			render 'show.json.jbuilder'
		else
			render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		render json: {message: "Product successfully destroyed!"}
	end

end
