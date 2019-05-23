class Product < ApplicationRecord

	has_many :product_categories
	has_many :categories, through: :product_categories

	has_many :orders

	belongs_to :supplier #single supplier hash
	# def supplier
	# 	Supplier.find_by(id: supplier_id)
	# end
	has_many :images

	validates :name, presence: true, uniqueness: true
	validates :price, numericality: {greater_than: 0}
	# validates :description, length: {in: 10..500}

	def category_names
		categories.map { |category| category.name }
	end

	def is_discounted?
		price <= 10
	end

	def tax
		price * 0.09
	end

	def total
		price + tax
	end

end
