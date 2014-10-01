require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
  product = Product.new
  assert product.invalid?
  assert product.errors[:title].any?
  assert product.errors[:description].any?
  assert product.errors[:price].any?
  assert product.errors[:image_url].any?

  test "product price must be positive" do
  product = products(:one)

  product.price = -1
  assert product.invalid?
  assert product.errors[:price].any?

  product.price = 0
  assert product.invalid?
  assert product.errors[:price].any?

  product.price = 1
  assert product.valid?
  assert product.errors[:price].none?
end
