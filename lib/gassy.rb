require "open-uri"

module Gassy
  def self.fetch_results
    url = 'http://www.eia.gov/petroleum/gasdiesel/includes/gas_diesel_rss.xml'
    page = open(url)
    page.read
  end
end
