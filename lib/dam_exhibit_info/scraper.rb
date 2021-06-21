# Need to scrape index page for current exhibits: name, date, and subtitle
# Need to scrape index page for upcoming exhibits: name, date, and subtitle
# Need to then scrape each current exhibit page for: date and detailed description.
# Need to then scrape each upcoming exhibit page for: date and detailed description.

#!/usr/bin/env ruby

require 'pry'
require 'nokogiri'
require 'open-uri'

class DamExhibitInfo::Scraper 
    def self.get_page
        Nokogiri::HTML(open("https://www.denverartmuseum.org/en/exhibitions"))
    end 

    # current exhibits:
    def self.scrape_current_exhibits_index
        self.get_page.css("div.section.section-view.mode-default.full-width#current a.full-card").each.with_index(1) do |exhibit, index|
            name = exhibit.css("div.title").text.strip
            date = exhibit.css("div.dateline").text.strip
            summary = exhibit.css("div.subtitle").text.strip
            
            puts "#{index}. #{name} - #{date} - #{summary}"
        end
    end

    # upcoming exhibits:
    def self.scrape_upcoming_exhibits_index
        self.get_page.css("div.section.section-view.mode-default.full-width#view-23075 a.full-card").each.with_index(1) do |exhibit, index|
            name = exhibit.css("div.title").text.strip
            date = exhibit.css("div.dateline").text.strip
            summary = exhibit.css("div.subtitle").text.strip

            puts "#{index}. #{name} - #{date} - #{summary}"
        end
    end

    # def scrape_exhibit_urls
        
    # end

    # def scrape_current_exhibit_details

    # end

    # def scrape_upcoming_exhibit_details

    # end
end

