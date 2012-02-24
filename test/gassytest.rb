require "../lib/gassy"
require "../lib/gassy_utils"
require "nokogiri"

    gassy = Gassy.new
    
    gassy.get_cities.each do |city|
      price = gassy.extract_price(city)
      puts "The average gas price in #{city} is #{price}."
    end
    puts "\n\n-----------\n\n"
    gassy.get_states.each do |state|
      price = gassy.extract_price(state)
      puts "The average gas price in #{state} is #{price}."
    end
    puts "\n\n-----------\n\n"
    gassy.get_regions.each do |region|
      price = gassy.extract_price(region)
      puts "The average gas price in the #{region} is #{price}."
    end

    

