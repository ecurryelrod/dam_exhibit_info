class DamExhibitInfo::Scraper 
    def self.get_page
        Nokogiri::HTML(open("https://www.denverartmuseum.org/en/exhibitions"))
    end 

    def self.scrape_exhibit_info(selector)
        self.get_page.css(selector).each do |exhibit| # had: self.get_page.css(selector).each.with_index(1) do |exhibit, index|
            name = exhibit.css("div.title").text.strip
            date = exhibit.css("div.dateline").text.strip
            summary = exhibit.css("div.subtitle").text.strip
            link = exhibit.attribute("href").value
            selector.include?("current") ? current = true : current = false
            DamExhibitInfo::Exhibit.create(name, date, summary, current, link)
        end
        # binding.pry
    end

    def self.scrape_exhibit_description(exhibit)
        page = Nokogiri::HTML(open("https://www.denverartmuseum.org/#{exhibit.link}"))
        @description = page.css("section.overview").text.strip
    end
end

