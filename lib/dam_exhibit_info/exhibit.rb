class DamExhibitInfo::Exhibit 
    attr_accessor :name, :date, :summary, :current, :link, :description

    @@all = []
    @@exhibit_description = []

    def initialize(name, date, summary = "", current, link)
        @name = name
        @date = date
        @summary = summary
        @current = current
        @link = link
        # @description = description
    end

    def save
        @@all << self
    end 

    def self.all
        @@all
    end

    def self.reset_all
        @@all.clear
    end

    def self.create(name, date, summary = "", current, link)
        exhibit = self.new(name, date, summary, current, link)
        exhibit.name = name
        exhibit.save unless self.find_by_name(name)
        exhibit
    end

    def self.find_by_name(name)
        self.all.find {|exhibit| exhibit.name == name}
    end

    def self.make_current_exhibits
        DamExhibitInfo::Scraper.scrape_exhibit_info("div.section.section-view.mode-default.full-width#current a.full-card")
        
    end

    def self.make_upcoming_exhibits
        DamExhibitInfo::Scraper.scrape_exhibit_info("div.section.section-view.mode-default.full-width#view-23075 a.full-card")
    end

    def self.all_by_status(status)
        if status == "current"
            @@all.select {|exhibit| exhibit.current == true}
        elsif status == "upcoming"
            @@all.select {|exhibit| exhibit.current == false}
        end
    end

    # def self.exhibit_description(exhibit)
    #     DamExhibitInfo::Scraper.scrape_exhibit_description(exhibit)
    # end
    
    def self.current_exhibit_description(exhibit)
        if exhibit.current == true
            # binding.pry
            DamExhibitInfo::Scraper.scrape_exhibit_description(exhibit)
        end
    end 

    def self.upcoming_exhibit_description(exhibit)
        if exhibit.current == false
            # binding.pry
            DamExhibitInfo::Scraper.scrape_exhibit_description(exhibit)
        end
    end
end

