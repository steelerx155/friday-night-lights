require 'nokogiri'
require 'open-uri'
require 'byebug'

class Scraper
    def scrape_updates_urls
        the_d_zone_url = "https://football.thedzone.com/"
        html = open(the_d_zone_url)
        doc = Nokogiri::HTML(html)        
        dzone = doc.css('.grid-container').css('ul').css('li').css('a')
        updates_urls = []
        dzone.each do |d|
          url = d.attribute('href').value
          updates_urls << url  
        end
        scrape_updates_pages(updates_urls)
    end

    def scrape_updates_pages(updates_urls)
        header_items = []
        updates_urls.each do |update_url|
            url = "https://football.thedzone.com"
            html = open(url)
            doc = Nokogiri::HTML(html)
            header = doc.css('#main-header')
            header_items << doc.css('#main-header').css('.header-sticky').css('.sport-tabs').css('.grid-container')
            byebug
    end   
end

scrape = Scraper.new
scrape.scrape_updates_urls
end