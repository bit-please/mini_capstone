class Api::OrdersController < ApplicationController

	before_action :authenticate_user

	def index
		@orders = current_user.orders
		render 'index.json.jbuilder'
	end

	def show
		@order = Order.find(params[:id])
		render 'show.json.jbuilder'
	end

	def create
		product = Product.find(params[:product_id])

		calculated_subtotal = product.price * params[:quantity].to_i
		calculated_tax = calculated_subtotal * 0.09
		calculated_total = calculated_subtotal + calculated_tax

		@order = Order.new(
			product_id: params[:product_id],
			quantity: params[:quantity],
			user_id: current_user.id,
			subtotal: calculated_subtotal,
			tax: calculated_tax,
			total: calculated_total
		)
		if @order.save
			render 'show.json.jbuilder'
		else
			render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
		end
	end

end
