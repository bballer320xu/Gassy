#
# Utility classes used by GassyUtils
#
module Gassy
  module GassyUtils

    # Condense the provided XML file by removing all spaces and new lines
    #
    # Example:
    #   >> condensed = GassyUtils.condense_xml(file)
    #
    def self.condense_xml(file)
      file = file.gsub(/\r/,"")
      file = file.gsub(/\n/,"")
      file = file.gsub(/\t/,"")
      file = file.gsub(/\s+/,"")
    end
  
    # Simple string substitution method alias 
    #
    # Example:
    #   >> file_with_renamed_entry = GassyUtils.rename(file, "Joe", "Sam")
    #
    def self.rename(file, old_name, new_name)
      file.sub(old_name, new_name)  
    end

    # Automatically generate methods that returns data for the Entities listed in the Gassy::GassyConstants::ENTITIES array. 
    #
    # Example:
    #   >> array_of_city_names = GassyUtils.cities
    #
    def self.method_missing(name, *args)
      super unless GassyConstants::ENTITIES.include?(name.to_s)
        eval("GassyConstants::#{name.upcase}")
    end
  
  end
end