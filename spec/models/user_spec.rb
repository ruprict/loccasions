require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory.build(:user)
  end

  describe "the 'Name' attribute" do
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
  describe "User Event" do
    it "can be built for a user"  do
      lambda {
        @user.events.build(:name=>"A new event")
      }.should change(@user.events, :length).by(1)
    end
    it "can be removed from a user" do
      @user.events.build(:name => "A short event")
      lambda {
        @user.events.first.destroy 
      }.should change(@user.events, :length).by(-1)
    end
  end
end
