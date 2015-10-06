require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create!(name: "test name", email: "email@gmail.com", password_digest: "heurerhe343243edjfwfgsh", password: "hihihihihihihi")
  end

  describe "creation" do
    it "should have one item after being created" do
      expect(User.all.count).to eq(1)
    end
  end

  describe "validations" do
    it "should not let a user be created without an email address" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "should not let a user be created without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "should not let a user be created without a name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "length validations" do
    it "should fail if password is less than 8 characters" do
      @user.password = 'agggggo'
      expect(@user).to_not be_valid
    end
  end
end
