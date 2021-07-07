class DamExhibitInfo::Exhibit 
    attr_reader :name, :date, :summary, :type, :link
    attr_accessor :description

    @@all = []

    def initialize(name, date, summary = "", type, link)
        @name = name
        @date = date
        @summary = summary
        @type = type
        @link = link
    end

    def save
        @@all << self
    end 

    def self.all
        @@all
    end

    def self.create(name, date, summary = "", type, link)
        exhibit = self.new(name, date, summary, type, link)
        exhibit.save unless self.find_by_name(name)
        exhibit
    end

    def self.find_by_name(name)
        self.all.find {|exhibit| exhibit.name == name}
    end
    
    def self.make_exhibits
        DamExhibitInfo::Scraper.scrape_exhibit_info("div.section.section-view.mode-default.full-width#current a.full-card") && 
        DamExhibitInfo::Scraper.scrape_exhibit_info("div.section.section-view.mode-default.full-width#view-23075 a.full-card")
    end

    def self.all_exhibits_by_type(type)
        self.make_exhibits
        if type == "current"
            self.all.select {|exhibit| exhibit.type == "current"}
        elsif type == "upcoming"
            self.all.select {|exhibit| exhibit.type == "upcoming"}
        end
    end
    
    def self.exhibit_description(exhibit)
        exhibit.description = DamExhibitInfo::Scraper.scrape_exhibit_description(exhibit)
    end
end

