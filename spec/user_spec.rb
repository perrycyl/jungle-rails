require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do

        it 'should require password and password confirmations' do
            @user1 = User.create(email:'1@1.com', password:"test", password_confirmation:"test", first_name:"Perry", last_name:"Liu")
            expect(@user1).to be_valid
            puts @user1.errors.full_messages
        end

        it 'should require prevent duplicate email of test@test.com' do
            @user1 = User.create(email:'test@test.com', password:"test", password_confirmation:"test", first_name:"Perry", last_name:"Liu")
            expect(@user1).to be_invalid
            puts @user1.errors.full_messages
        end

        it 'should require first name' do
            @user1 = User.create(email:'yay@yay.com', password:"test", password_confirmation:"test", first_name: nil, last_name:"Liu")
            expect(@user1).to be_invalid
            puts @user1.errors.full_messages
        end

        it 'should require last name' do
            @user1 = User.create(email:'yay@yay.com', password:"test", password_confirmation:"test", first_name: "Perry", last_name: nil)
            expect(@user1).to be_invalid
            puts @user1.errors.full_messages
        end

        it 'should fail if password and confirmation is empty' do
            @user1 = User.create(email:'yay@yay.com', password: nil, password_confirmation: nil , first_name: "Perry", last_name: "Liu")
            expect(@user1).to be_invalid
            puts @user1.errors.full_messages
        end
    end

    describe '.authenticate_with_credentials ' do
    
        it 'should find email in database' do
            puts User.count
            @user1 = User.create(email:'1@1.com', password:"123", first_name:"Perry", last_name:"Liu")
            @validate = User.authenticate_with_credentials('123','1@1.com')
            expect(@validate).to be_valid
            puts @user1.errors.full_messages
        end
        
        it 'should find password in database' do
            puts User.count
            @user1 = User.create(email:'1@1.com', password:"123", first_name:"Perry", last_name:"Liu")
            user = User.find_by_email('1@1.com')
            @validate = User.authenticate_with_credentials('123','1@1.com')
            expect(@validate).to be_valid
            puts @user1.errors.full_messages
        end

        it 'should find email even with spacing in database' do
            puts User.count
            @user1 = User.create(email:'1@1.com', password:"123", first_name:"Perry", last_name:"Liu")
            @validate = User.authenticate_with_credentials('123',' 1@1.com')
            expect(@validate).to be_valid
            puts @user1.errors.full_messages
        end

        it 'should find email even with wrongcase in database' do
            puts User.count
            @email01 = 'ABC@gmail.com'.downcase! #mimics downcase prior to putting data into DB
            @user1 = User.create(email:@email01, password:"123", first_name:"Perry", last_name:"Liu")
            @validate = User.authenticate_with_credentials('123',' abC@gmail.com')
            expect(@validate).to be_valid
            puts @user1.errors.full_messages
        end

    end
end