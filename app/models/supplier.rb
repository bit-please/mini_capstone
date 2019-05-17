class Supplier < ApplicationRecord

	def products #array of product hashes
		Product.where(supplier_id: id)
	end

end
