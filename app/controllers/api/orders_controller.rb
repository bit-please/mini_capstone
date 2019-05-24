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
		@carted_products = current_user.carted_products.where(status: "carted")

		calculated_subtotal = 0
		@carted_products.each do |carted_product|
			calculated_subtotal += carted_product.quantity * carted_product.product.price
		end

		calculated_tax = calculated_subtotal * 0.09
		calculated_total = calculated_subtotal + calculated_tax

		@order = Order.new(
			user_id: current_user.id,
			subtotal: calculated_subtotal,
			tax: calculated_tax,
			total: calculated_total
		)
		if @order.save
			@carted_products.update_all(status: "purchased", order_id: @order.id)
			render 'show.json.jbuilder'
		else
			render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
		end
	end

end
