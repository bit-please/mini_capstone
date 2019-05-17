class Product < ApplicationRecord

	def supplier #single supplier hash
		Supplier.find_by(id: supplier_id)
	end

	validates :name, presence: true, uniqueness: true
	validates :price, numericality: {greater_than: 0}
	validates :image_url, presence: true
	# validates :description, length: {in: 10..500}

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
