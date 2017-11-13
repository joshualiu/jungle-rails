require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'Validations' do


    it "should return a valid user is true" do
      @user = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "joshy@email.com",
        password: '111111',
        password_confirmation: '111111'
      )
      expect(@user.save).to be true
    end

    it "should return false when a user's passwords are not match" do
      @user = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "joshy@email.com",
        password: 'abc1111',
        password_confirmation: 'cba1111'
      )
      expect(@user.save).to be false
    end

    it "should return false when a user don't have passwords" do
      @user = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "joshy@email.com",
        password: nil,
        password_confirmation: nil
      )
      expect(@user.save).to be false
    end

    it "should return false when a user's email is not unique" do
      @user1 = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "TEST@TEST.com",
        password: '111111',
        password_confirmation: '111111'
      )
      @user2 = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "test@test.COM",
        password: '111111',
        password_confirmation: '111111'
      )
      expect(@user2.save).to be false
    end

    it "should return false when a user's first name is missing" do
      @user = User.create(
        firstName: nil,
        lastName: "Liu",
        email: "joshy@email.com",
        password: '111111',
        password_confirmation: '111111'
      )
      expect(@user.save).to be false
    end

    it "should return false when a user's last name is missing" do
      @user = User.create(
        firstName: "Joshy",
        lastName: nil,
        email: "joshy@email.com",
        password: '111111',
        password_confirmation: '111111'
      )
      expect(@user.save).to be false
    end

    it "should return false when a user's email is missing" do
      @user = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: nil,
        password: '111111',
        password_confirmation: '111111'
      )
      expect(@user.save).to be false
    end

    it "should return false when a user's password is less than 6 letters" do
      @user = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "test@gmail.com",
        password: '1',
        password_confirmation: '1'
      )
      expect(@user.save).to be false
    end

    it "should return false when a user's email format is not correct" do
      @user = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "tescom",
        password: '1',
        password_confirmation: '1'
      )
      expect(@user.save).to be false
    end

  end  
  
  describe '.authenticate_with_credentials' do

    it "should return true when the authentication pass" do
      @user1 = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "joshy@email.com",
        password: '111111',
        password_confirmation: '111111'
      )

      @user = User.authenticate_with_credentials("joshy@email.com", "111111")
      expect(@user).to be true
    end

    it "should return false when the authentication fail" do
      @user1 = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "joshy@email.com",
        password: '111111',
        password_confirmation: '111111'
      )

      @user = User.authenticate_with_credentials("joshy@email.com", "222222")
      expect(@user).to be false
    end

    it "should return true when a user's login form include some white spaces" do
      @user1 = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "  joshy@email.com ",
        password: '111111',
        password_confirmation: '111111'
      )

      @user = User.authenticate_with_credentials("   joshy@email.com      ", "111111")
      expect(@user).to be false
    end

    it "should return true when a user types in wrong case for their email" do
      @user1 = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "joshy@email.COM",
        password: '111111',
        password_confirmation: '111111'
      )

      @user = User.authenticate_with_credentials("jOshy@EMAIL.com", "111111")
      expect(@user).to be false
    end

  end

end
