require "../lib/gassy"
require "../lib/gassy_utils"
require "../lib/gassy_constants"
require "nokogiri"

describe "The XML Gasoline Data File" do
  

  before(:all) do
    @file = Gassy.fetch_results
    
    #Compress the XML file for simplified regex processing
    @compressed_file = GassyUtils.condense_xml(@file)
  end
  
  it "should return a vaild XML file for processing" do
    parsed_doc = Nokogiri::XML(@file) do |config| 
      config.options = Nokogiri::XML::ParseOptions::STRICT 
    end
    parsed_doc.errors.count.should eq(0)
  end
  
  
  describe "will contain cities" do
    CITIES.each do |city|
      it "and should contain the city of '#{city}'" do 
        @compressed_file.scan(/Cities.*#{city.gsub(/\s+/, "")}/).should_not be_empty 
      end
    
      it "and should extract a gas price for the city of '#{city}' as a float" do 
        GassyUtils.extract_price(city, @compressed_file).should be_an_instance_of(Float)
      end
    
      it "and should extract a gas price for the city of '#{city}' greater than 0" do 
        GassyUtils.extract_price(city, @compressed_file).should be > 0
      end
    end
  end
  
  describe "will contain states" do
    STATES.each do |state|
      it "and should contain the state of '#{state}'" do 
        @compressed_file.scan(/States.*#{state.gsub(/\s+/, "")}/).should_not be_empty 
      end
    
      it "and should extract a gas price for the state of '#{state}' as a float" do 
        GassyUtils.extract_price(state, @compressed_file).should be_an_instance_of(Float)
      end
    
      it "and should extract a gas price for the state of '#{state}' greater than 0" do 
        GassyUtils.extract_price(state, @compressed_file).should be > 0
      end
    end
  end
  
  describe "will contain regions" do
    REGIONS.each do |region|
      it "and should contain the region of '#{region}'" do 
        @compressed_file.scan(/RegularGasolineRetailPrice.*#{region.gsub(/\s+/, "")}/).should_not be_empty 
      end
    
      it "and should extract a gas price for the region of '#{region}' as a float" do 
        GassyUtils.extract_price(region, @compressed_file).should be_an_instance_of(Float)
      end
    
      it "and should extract a gas price for the region of '#{region}' greater than 0" do 
        GassyUtils.extract_price(region, @compressed_file).should be > 0
      end
    end
  end

  
end


