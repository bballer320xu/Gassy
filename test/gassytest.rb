require "../lib/gassy"
require "nokogiri"



    file = Gassy.fetch_results

    puts file.scan(/San Francisco*Seattle/)
    puts file.scan(/Cities*Seattle/)

