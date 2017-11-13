require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    before(:each) do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = Product.new
      @product.name = "Lala"
      @product.price = 100
      @product.quantity = 4  
      @product.category = cat1
    end

    it 'should validate when full specs met' do
      expect(@product).to be_valid
    end
    
    it 'should not validate without name input' do
      @product.name = nil
      expect(@product).not_to be_valid
    end

    it 'should not validate without price input' do
      @product.price_cents = nil
      expect(@product).not_to be_valid
    end

    it 'should not validate without price input' do
      @product.quantity = nil
      expect(@product).not_to be_valid
    end

    it 'should not validate without price input' do
      @product.category = nil
      expect(@product).not_to be_valid
    end
    


  end
end



# name, price, quanity, category