class Api::CartedProductsController < ApplicationController

	def index
		@carted_products = current_user.carted_products.where(status: "carted")
		render 'index.json.jbuilder'
	end

	def create
		@carted_product = CartedProduct.new(
			user_id: current_user.id,
			product_id: params[:product_id],
			quantity: params[:quantity],
			status: "carted"
		)
		if @carted_product.save
			render 'show.json.jbuilder'
		else
			render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def destroy
		# fix to only allow status change if current users carted product
		@carted_product = CartedProduct.find(params[:id])
		@carted_product.update(status: "removed")
		render json: {message: "Carted Product successfully removed"}
	end

end
