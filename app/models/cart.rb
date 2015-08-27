class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def subtotal
    line_items.to_a.sum { |item| item.total_price }
  end
  
end

