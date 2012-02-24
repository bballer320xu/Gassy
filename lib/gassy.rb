require "open-uri"
require "gassy/gassy_utils"
require "gassy/gassy_constants"


# Gassy is a simple gem that processes Gas price data publicly available on the U.S. Energy Information Administration website. 
# 
# Features:
# * Quick Gas Price lookup for Major Cities, States, and Regions
# * Extracts live data from the U.S. Energy Information Administration website
#
module Gassy
  
  @file = nil
  
  class << self
    attr_reader :file
  
  
  
    # Get all Price Data and return it as a nested hash
    #
    # Example:
    #   >> price_hash = gassy.get_all_price_data
    #
    def get_all_price_data
      @data = {:cities => {}, :states => {}, :regions => {}}
      @data.each_key do |key|
        GassyUtils.send("#{key}").each do |entity|
          @data[key][entity] = extract_one_price(entity)
        end
      end
      @data
    end



    # Get one Price for an entity and return it as a Float.  Return nil if the entity is not found
    #
    # Example:
    #   >> boston_price = gassy.extract_one_price("Boston")
    #
    # * +entity+ - An entity to look up a price for.  Can be a city, state, or region.
    #  
    def extract_one_price(entity)
      init_file
      condensed = GassyUtils.condense_xml(@file)
      remove_diesel = condensed.match(/.*On-Highway/).to_s
      listing = remove_diesel.match(/\d*.\d*\D*#{entity.gsub(/\s+/, "")}(&lt;)/).to_s
      price = listing.match(/\d*.\d*/).to_s.to_f  
    end
   
   
    
    # This will force the cached datafile to be refreshed with new data from the website.  
    #
    # Example:
    #   >> Gassy.refresh_datafile
    #
    def refresh_datafile
      init_file(true)
    end
    
    
    
    # This will force the cached datafile to be refreshed with a locally provided file.
    #
    # Example:
    #   >> Gassy.load_datafile
    #
    # * +file_path+ - The path to the file to process
    #
    def load_datafile(file_path)
        init_file(true, file_path)
    end
    
    
    
    private
    
    
    
    # 
    # Method to initialize or retrieved the data file.
    #
    def init_file(refresh = false, file = nil)
      if (@file.nil? || refresh == true)
        unless !file.nil?
          file = GassyConstants::SOURCE_FILE
        end     
        @file = GassyUtils.rename(open(file).read, "West Coast less California", "North West Coast") 
        if @file.nil?
          raise IOError, "A source file could not be read at #{file}" 
        end
      else
        @file
      end
    end
  end

end

















