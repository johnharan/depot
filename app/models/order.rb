class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
        validates :title, :description, :image_url, presence: true, allow_blank: false

	PAYMENT_TYPES = [ "Cheque", "Credit card", "Purchase order" ]

        validates :pay_type, inclusion: PAYMENT_TYPES

        def add_line_items_from_cart(cart)
  	   cart.line_items.each do |item|
    	     item.cart_id = nil
             line_items << item
           end
        end

	
end
