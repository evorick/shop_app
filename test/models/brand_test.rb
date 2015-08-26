require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "brand fields must not be empty" do
    brand = Brand.new
    assert_not brand.save, "saved brand with empty fields"
  end

  test "brand name should be unique" do
    brand = Brand.new
    brand.name = brands(:one).name
    assert_not brand.save, "saved brand with non-unique name"
  end

  test "brand saves with all valid fields" do
    brand = Brand.new(name: "unique_brand")
    assert brand.save, "brand wasn't saved when valid fields were supplied"
  end

end
