require "open-uri"
require "gassy/gassy_utils"
require "gassy/gassy_constants"

class Gassy
  
  attr_reader :file
  
  def initialize(file = GassyConstants::SOURCE_FILE)
    @file = open(file).read  
    @file = GassyUtils.rename(@file, "West Coast less California", "North West Coast")  
  end
  
  def get_all_price_data
    @data = {:cities => {}, :states => {}, :regions => {}}
    @data.each_key do |key|
      GassyUtils.send("#{key}").each do |entity|
        @data[key][entity] = extract_one_price(entity)
      end
    end

    @data
  end

  def extract_one_price(entity)
    condensed = GassyUtils.condense_xml(@file)
    remove_diesel = condensed.match(/.*On-Highway/).to_s
    listing = remove_diesel.match(/\d*.\d*\D*#{entity.gsub(/\s+/, "")}(&lt;)/).to_s
    price = listing.match(/\d*.\d*/).to_s.to_f  
  end
end
