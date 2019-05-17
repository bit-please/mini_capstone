class Supplier < ApplicationRecord

	has_many :products #array of product hashes
	# def products 
	# 	Product.where(supplier_id: id)
	# end

end
