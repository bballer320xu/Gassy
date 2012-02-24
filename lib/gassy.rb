require "open-uri"
require "../lib/gassy_constants"

class Gassy
  
  def initialize
    @file = open(GassyConstants::SOURCE_FILE).read  
    @file = @file.sub("West Coast less California", "North West Coast")  
  end
  
  def get_cities
    GassyConstants::CITIES
  end
  
  def get_states
    GassyConstants::STATES
  end
  
  def get_regions
    GassyConstants::REGIONS
  end
  
  def extract_price(entity)
    condensed = GassyUtils.condense_xml(@file)
    remove_diesel = condensed.match(/.*On-Highway/).to_s
    listing = remove_diesel.match(/\d*.\d*\D*#{entity.gsub(/\s+/, "")}(&lt;)/).to_s
    price = listing.match(/\d*.\d*/).to_s.to_f  
  end
end
