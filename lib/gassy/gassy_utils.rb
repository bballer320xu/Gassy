module GassyUtils

  def self.condense_xml(file)
    file = file.gsub(/\r/,"")
    file = file.gsub(/\n/,"")
    file = file.gsub(/\t/,"")
    file = file.gsub(/\s+/,"")
  end
  
  def self.rename(file, old_name, new_name)
    file.sub(old_name, new_name)  
  end

  def self.method_missing(name, *args)
    super unless GassyConstants::ENTITIES.include?(name.to_s)
      eval("GassyConstants::#{name.upcase}")
  end
  
end