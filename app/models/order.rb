class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
  validates :name, :address, :user_id, presence: true

  PAYMENT_TYPES = ["Check", "Credit Card", "PayPal"]
  validates :payment_type, inclusion: PAYMENT_TYPES
end
