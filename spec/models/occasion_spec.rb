require 'spec_helper'

describe "Occasion" do
  before do
    @occasion = Factory.create(:occasion)
  end
  it "should have a time and date of occurrance" do
    dt = Time.now
    @occasion.occurred_at = dt

    @occasion.occurred_at.to_s.should == dt.to_s
  end  

  it "should have a latitude and longitude" do
    @occasion.latitude = -85.000
    @occasion.longitude = 35.3232

    @occasion.latitude.should == -85.000
    @occasion.longitude.should == 35.3232
  end

  it "should have a note" do
    @occasion.note = "This thang went down"
    @occasion.note.should == "This thang went down"
  end

  describe "validation" do
    it "should require a latitude" do
      @occasion.latitude = nil
      @occasion.should_not be_valid
    end  

    it "should require a longitude" do
      @occasion.longitude = nil
      @occasion.should_not be_valid
    end  
  end
end
