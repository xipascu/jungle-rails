require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before(:each) do
      @user = User.new
      @user.first_name = "Donkey"
      @user.last_name = "Kong"
      @user.email = "donkeykong@donkey.kong"
      @user.password = "donkeykong"
      @user.password_confirmation = "donkeykong"
      @user.save
    end

    it 'should create a new instance given valid attributes' do
      expect(@user).to be_valid
    end

    it 'should not validate without first name' do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it 'should not validate without last name' do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it 'should not validate without a password' do
      @user.password = nil
      expect(@user).not_to be_valid
    end

    it 'should not validate without a password confirmation' do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end

    it 'should not validate if pass and pass confirmation are different' do
      @user.password_confirmation = "nil"
      expect(@user).not_to be_valid
    end
    
    it 'should not validate without password digest' do
      @user.password_digest = nil
      expect(@user).not_to be_valid
    end

    it 'should not validate without email' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'password length less than 5 characters is invalid' do
      @user.password = '1234'
      @user.password_confirmation = '1234'
      @user.save
      expect(@user).not_to be_valid
    end

    it 'should not validate if same email' do
      @user1 = User.new 
      @user1.first_name = "Donki"
      @user1.last_name = "Kongi"
      @user1.email = "donkeyKong@donkey.kong"
      @user1.password = "donkey"
      @user1.password_confirmation = "donkey"
      @user1.save
      expect(@user1).not_to be_valid
    end
  end


  describe 'authenticate_with_credentials' do
    before(:each) do
      @user = User.new
      @user.first_name = "Donkey"
      @user.last_name = "Kong"
      @user.email = "donkeykong@donkey.kong"
      @user.password = "donkeykong"
      @user.password_confirmation = "donkeykong"
      @user.save
    end

    it 'should create a new instance given valid attributes' do
      expect(@user).to be_valid
    end

    
    it 'should validate when email has spaces' do
      @user.email = " donkeykong@donkey.kong"
      expect((User.authenticate_with_credentials @user.email, @user.password) == @user).to be_present
    end

    it 'should validate with lower and upper case' do
      @user.email = "dOnkeYKong@donkeY.Kong"
      expect((User.authenticate_with_credentials @user.email, @user.password) == @user).to be_present
    end

  end
end
