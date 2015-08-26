require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

test "product fields must not be empty" do
   product = Product.new
   assert_not product.save, "saved product with empty attributes"
 end

 test "product name should be unique" do
   product = Product.new(price: 1, description: "my description", category_id: 1, brand_id: 1, quantity: 1)
   product.name = products(:one).name
   assert_not product.save, "saved product with non-unique name"
 end

 test "product price must be positive and greater than zero" do
   product = Product.new(name: "my product", description: "my description", category_id: 1, brand_id: 1, quantity: 1)

   product.price = 0
   assert product.invalid?, "invalid product"
   assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

   product.price = 1
   assert product.valid?, "product was invalid when given valid price"
 end

 test "product saves with all valid attributes" do
   product = Product.new(name: "my product", description: "my description", category_id: 1, brand_id: 1, quantity: 1, price: 1)
   assert product.save, "product wasn't saved when valid fields given"
 end

end