require 'nokogiri'
require 'open-uri'
require 'byebug'

class Scraper
    def scrape_tabs_urls
        the_d_zone_url = "https://football.thedzone.com/"
        html = open(the_d_zone_url)
        doc = Nokogiri::HTML(html)
        
        dzone = doc.css('.grid-container').css('#main-page').css('#grid-x list-index feed news grid-margin-y')
   # byebug
        dzone.each do |d|
            url = d.attribute('article').value
            byebug
        end
    end
end
scrape = Scraper.new
scrape.scrape_tabs_urls
