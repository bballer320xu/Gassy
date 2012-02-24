require 'spec_helper'

describe "The Gassy main class" do
  
  before(:all) do   
    @gassy = Gassy.new()

  end
  
  describe "should have a method 'get_all_price_data'" do
    it "that returns a proper hash" do
      @gassy.get_all_price_data.should be_an_instance_of(Hash)
    end
  end
  
  describe "should allow a proper file to be fed in without retrieval during initialize" do
    
  end
end


