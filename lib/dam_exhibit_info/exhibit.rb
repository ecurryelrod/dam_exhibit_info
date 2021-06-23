#!/usr/bin/env ruby

require 'pry'

class DamExhibitInfo::Exhibit 
    attr_accessor :name, :date, :summary, :current#, :description #, :link, 

    @@all = []

    def initialize(name, date, summary = "", current)
        @name = name
        @date = date
        @summary = summary
        @current = current
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

    def self.create(name, date, summary = "", current)
        exhibit = self.new(name, date, summary, current)
        # exhibit = self.new(name, date, summary)
        exhibit.name = name
        exhibit.save unless self.find_by_name(name)
        exhibit
    end
    
    # def self.create_by_name(exhibit_name)
    #     exhibit = self.create(@name, @date, @summary, @current)
    #     exhibit.name = exhibit_name
    #     exhibit
    # end

    def self.find_by_name(name)
        self.all.find {|exhibit| exhibit.name == name}
    end

    # def self.find_or_create_by_name(name)
    #     self.find_by_name(@name) || self.create(@name, @date, @summary, @current)
    # end

    def self.make_current_exhibits
        # DamExhibitInfo::Scraper.scrape_current_exhibits_index
        DamExhibitInfo::Scraper.scrape_exhibits("div.section.section-view.mode-default.full-width#current a.full-card")
        
    end

    def self.make_upcoming_exhibits
        DamExhibitInfo::Scraper.scrape_exhibits("div.section.section-view.mode-default.full-width#view-23075 a.full-card")
        # binding.pry
    end

    def self.all_by_status(status)
        if status == "current"
            @@all.select {|exhibit| exhibit.current == true}
        elsif status == "upcoming"
            @@all.select {|exhibit| exhibit.current == false}
        end
    end
end

