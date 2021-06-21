#!/usr/bin/env ruby

require 'pry'

class DamExhibitInfo::Exhibit 
    attr_accessor :name, :date, :subtitle #:description

    @@all = []

    def initialize#(name, date, subtitle = "")
        
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

    def self.create(name, date, subtitle = "")
        exhibit = self.new(name, date, subtitle)
        exhibit.save
        # create conditional here if exhibit doesn't have subtitle???
        exhibit
    end

    # Maybe current and upcoming exhibit methods in CLI need to go in here???
    # then I can save those instances to @@all and keep track of everything???

    # def self.find_by_name(name)
    #     exhibit.all.find {|exhibit| exhibit.name == name}
    # end

    # def self.find_or_create_by_name(name)
    #     self.find_by_name || self.create
    # end
end

