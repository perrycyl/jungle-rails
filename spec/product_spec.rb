require 'rails_helper'

RSpec.describe Product, type: :model do
    describe 'Validations' do
        # validation tests/examples here
        it 'should create a new product within Cat1' do 
            @cat1 = Category.create(name: 'test')
            @product1 = Product.create(name: 'test_name', price_cents: 100, quantity: 5, category: @cat1)
            expect(@product1).to be_valid
        end

        it 'should create a new product without a category' do
            @product2 = Product.create(name: 'product_test2', price_cents: 500, quantity: 1)
            expect(@product2).to be_invalid
        end

        it 'should fail if name is empty' do 
            @cat1 = Category.create(name: 'test')
            @product1 = Product.create(name: nil, price_cents: 100, quantity: 5, category: @cat1)
            expect(@product1).to be_invalid
        end

        it 'should fail if price_cents is float' do 
            @cat1 = Category.create(name: 'test')
            @product1 = Product.create(name: 'test_name2', price_cents: 150.53 , quantity: 5, category: @cat1)
            expect(@product1).to be_invalid
            puts @product1.errors.full_messages
        end

        it 'should fail if quantity is nil ' do 
            @cat1 = Category.create(name: 'test')
            @product1 = Product.create(name: "test_name3", price_cents: 100, quantity: nil, category: @cat1)
            expect(@product1).to be_invalid
        end
    end
end