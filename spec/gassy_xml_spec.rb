require 'spec_helper'

describe "The XML Gasoline Data File" do
  before(:all) do
    #Compress the XML file for simplified regex processing
    @compressed_file = Gassy::GassyUtils.condense_xml(Gassy.file)
  end
  
  it "should return a vaild XML file for processing" do
    parsed_doc = Nokogiri::XML(Gassy.file) do |config| 
      config.options = Nokogiri::XML::ParseOptions::STRICT 
    end
    parsed_doc.errors.count.should eq(0)
  end
  
  
  describe "will contain cities" do
    Gassy::GassyConstants::CITIES.each do |city|
      it "and should contain the city of '#{city}'" do 
        @compressed_file.scan(/Cities.*#{city.gsub(/\s+/, "")}/).should_not be_empty 
      end
    
      it "and should extract a gas price for the city of '#{city}' as a float" do 
        Gassy.extract_one_price(city).should be_an_instance_of(Float)
      end
    
      it "and should extract a gas price for the city of '#{city}' greater than 0" do 
        Gassy.extract_one_price(city).should be > 0
      end
    end
  end
  
  describe "will contain states" do
    Gassy::GassyConstants::STATES.each do |state|
      it "and should contain the state of '#{state}'" do 
        @compressed_file.scan(/States.*#{state.gsub(/\s+/, "")}/).should_not be_empty 
      end
    
      it "and should extract a gas price for the state of '#{state}' as a float" do 
        Gassy.extract_one_price(state).should be_an_instance_of(Float)
      end
    
      it "and should extract a gas price for the state of '#{state}' greater than 0" do 
        Gassy.extract_one_price(state).should be > 0
      end
    end
  end
  
  describe "will contain regions" do
    Gassy::GassyConstants::REGIONS.each do |region|
      it "and should contain the region of '#{region}'" do 
        @compressed_file.scan(/RegularGasolineRetailPrice.*#{region.gsub(/\s+/, "")}/).should_not be_empty 
      end
    
      it "and should extract a gas price for the region of '#{region}' as a float" do 
        Gassy.extract_one_price(region).should be_an_instance_of(Float)
      end
    
      it "and should extract a gas price for the region of '#{region}' greater than 0" do 
        Gassy.extract_one_price(region).should be > 0
      end
    end
  end
end


