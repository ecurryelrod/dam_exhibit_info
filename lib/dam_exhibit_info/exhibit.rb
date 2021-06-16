class DamExhibitInfo::Exhibit 
    attr_accessor :name, :date, :description
    @@all = []

    def initialize()

    end

    def self.all
        @@all
    end

    def self.create(attr_readers/accessors)
        exhibit = self.new(whatever attr_accessor/readers have in initialize)
        exhibit.save
        exhibit
        # create conditional here if need to exclude any missing information from scraped page.
    end

    def self.find_by_name(name)
        exhibit.all.find {|exhibit| exhibit.name == name}
    end

    def self.find_or_create_by_name(attr_accessors/readers)
        # if the exhibit already exists in @@all then find it
        # if not, then create it which also saves it to @@all
    end
end