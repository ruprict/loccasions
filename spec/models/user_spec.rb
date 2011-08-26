require 'spec_helper'

describe User do
  describe "the 'Name' attribute" do
    before(:each) do
      @user = Factory.build(:user)
    end
    it "should exist on the User model" do
      @user.should respond_to(:name)
      @user.should respond_to(:name=)
    end
    it "should be unique" do
      @user.save
      user2 = Factory.build(:user, :email=>'diff@example.com')
      user2.valid?.should be_false
      user2.errors[:name].should include("is already taken")
    end
    it "should be required" do
      @user.name=nil
      @user.valid?.should be_false
      @user.errors[:name].should include("can't be blank")
    end
  end
end
