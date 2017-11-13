require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'Validations' do


    it "should return a valid user is true" do
      @user = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "joshy@email.com",
        password: 'abc',
        password_confirmation: 'abc'
      )
      expect(@user.save).to be true
    end

    it "should return false when a user's passwords are not match" do
      @user = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "joshy@email.com",
        password: 'abc',
        password_confirmation: 'cba'
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
        password: nil,
        password_confirmation: nil
      )
      @user2 = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: "test@test.COM",
        password: nil,
        password_confirmation: nil
      )
      expect(@user2.save).to be false
    end

    it "should return false when a user's first name is missing" do
      @user = User.create(
        firstName: nil,
        lastName: "Liu",
        email: "joshy@email.com",
        password: nil,
        password_confirmation: nil
      )
      expect(@user.save).to be false
    end

    it "should return false when a user's last name is missing" do
      @user = User.create(
        firstName: "Joshy",
        lastName: nil,
        email: "joshy@email.com",
        password: nil,
        password_confirmation: nil
      )
      expect(@user.save).to be false
    end

    it "should return false when a user's email is missing" do
      @user = User.create(
        firstName: "Joshy",
        lastName: "Liu",
        email: nil,
        password: nil,
        password_confirmation: nil
      )
      expect(@user.save).to be false
    end
  end    

end
