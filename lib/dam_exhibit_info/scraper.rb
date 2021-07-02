class DamExhibitInfo::Scraper 
    def self.get_page
        Nokogiri::HTML(open("https://www.denverartmuseum.org/en/exhibitions"))
    end 

    def self.scrape_exhibit_info(selector)
        self.get_page.css(selector).each do |exhibit|
            name = exhibit.css("div.title").text.strip
            date = exhibit.css("div.dateline").text.strip
            summary = exhibit.css("div.subtitle").text.strip
            link = exhibit.attribute("href").value
            selector.include?("current") ? type = "current" : type = "upcoming"
            DamExhibitInfo::Exhibit.create(name, date, summary, type, link)
        end
    end

    def self.scrape_exhibit_description(exhibit)
        page = Nokogiri::HTML(open("https://www.denverartmuseum.org/#{exhibit.link}"))
        page.css("section.overview").text.strip
    end
end

