require 'spec_helper'

describe "The Gassy main class" do
  
  describe "should have a method 'get_all_price_data'" do
    it "that returns a proper hash" do
      Gassy.get_all_price_data.should be_an_instance_of(Hash)
    end
  end
  
  describe "should have a method 'extract_one_price'" do
    it "that returns a proper Float value for a correct entity" do
      Gassy.extract_one_price("Boston").should be_an_instance_of(Float)
    end
    
    it "that returns nil for an incorrect entity" do
      Gassy.extract_one_price("Ottawa").should be_an_instance_of(Float)
    end
  end
end


describe "The Gassy Utils class" do
  describe "should have a method to return all vaild cities" do
    it "as an array" do
      Gassy::GassyUtils.cities.should be_an_instance_of(Array)
    end
  end
  describe "should have a method to return all vaild states" do
    it "as an array" do
      Gassy::GassyUtils.states.should be_an_instance_of(Array)
    end
  end
  describe "should have a method to return all vaild regions" do
    it "as an array" do
      Gassy::GassyUtils.regions.should be_an_instance_of(Array)
    end
  end
  describe "should handle invalid method names" do
    it "by raising an error" do
       proc{Gassy.garbagemethod}.should raise_error
    end
  end
end


