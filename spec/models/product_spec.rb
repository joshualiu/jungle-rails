require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'Validations' do

    before do
      @name = "iPhoneX"
      @price = 139900
      @quantity = 1
      @category = Category.create(name: "SmartPhones")     
    end

    it "should return a valid product is true" do
      @product = Product.create(
        name: @name,
        price: @price,
        quantity: @quantity,
        category_id: @category.id
      )
      expect(@product.save).to be true
    end

    it "should return false when missing the product name" do
      @product = Product.create(
        name: nil,
        price: @price,
        quantity: @quantity,
        category_id: @category.id
      )
      expect(@product.save).to be false
    end

    it "should return false when missing the product price" do
      @product = Product.create(
        name: @name,
        price: nil,
        quantity: @quantity,
        category_id: @category.id
      )
      expect(@product.save).to be false
    end

    it "should return false when missing the product quantity" do
      @product = Product.create(
        name: @name,
        price: @price,
        quantity: nil,
        category_id: @category.id
      )
      expect(@product.save).to be false
    end

    it "should return false when missing the product category" do
      @product = Product.create(
        name: @name,
        price: @price,
        quantity: @quantity,
        category_id: nil
      )
      expect(@product.save).to be false
    end

  end

end
