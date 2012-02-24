require "../lib/gassy"
require "./gassy_spec_constants"
require "nokogiri"

describe "The XML Gasoline Data File" do
  

  before(:all) do
    @file = Gassy.fetch_results
  end
  
  it "should return a vaild XML file for processing" do
    parsed_doc = Nokogiri::XML(@file) do |config| 
      config.options = Nokogiri::XML::ParseOptions::STRICT 
    end
    parsed_doc.errors.count.should eq(0)
  end

  CITIES.each do |city|
    it "should contain the city of '#{city}'" do 
      @file.scan(/#{city}/).should_not be_empty 
    end
  end
  
  STATES.each do |city|
    it "should contain the city of '#{city}'" do 
      @file.scan(/#{city}/).should_not be_empty 
    end
  end
  
  REGIONS.each do |city|
    it "should contain the city of '#{city}'" do 
      @file.scan(/#{city}/).should_not be_empty 
    end
  end
  
end


