class DamExhibitInfo::CLI 
    def call
        puts "\n>>>>>>>>>  Welcome to the Denver Art Museum!  <<<<<<<<<"
        get_user_input
    end
        
    def get_user_input
        puts "\nSelect a number below to see current or upcoming exhibits:"
        puts "\n  1. Current Exhibits"
        puts "  2. Upcoming Exhibits"
        puts "\n  Type 'exit' to exit the program"
        
        input = gets.strip

        case input
        when "1"
            current_exhibits
        when "2"
            upcoming_exhibits
        when "exit"
            puts "\nHave a wonderful day filled with art!"
            puts ""
        end
    end

    def menu_options
        puts "\nTo go back to the root menu type 'menu'"
        # puts "To see to Current Exhibits type 'current'"
        # puts "To see Upcoming Exhibits type 'upcoming'"
        puts "To exit the program type 'exit'"
        input = gets.strip

        case input
        when "menu"
            get_user_input
        # when "current"
        #     current_exhibits
        # when "upcoming"
        #     upcoming_exhibits
        when "exit"
            puts "\nHave a wonderful day filled with art!"
            puts ""
        end
    end

    def valid_selection?
    # input = gets.to_i
    # if input
    end
    
    def current_exhibits
        puts "\nHere are the current exhibits at the Denver Art Museum\n"
        puts "Select a number below for a detailed discription of the exhibit"
        puts "\n======================================================="
        puts ""
        DamExhibitInfo::Exhibit.make_current_exhibits
        DamExhibitInfo::Exhibit.all_by_status("current").each.with_index(1) {|exhibit, index| puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
        puts "\n==============================================================="
        # valid_selection?
        
        input = gets.to_i
        selection = DamExhibitInfo::Exhibit.all[input - 1]
        puts ""
        puts DamExhibitInfo::Exhibit.current_exhibit_description(selection)
        menu_options
    end

    def upcoming_exhibits
        puts "\nHere are the upcoming exhibits at the Denver Art Museum"
        puts "Select a number below for a detailed discription of the exhibit"
        puts "\n==============================================================="
        DamExhibitInfo::Exhibit.make_upcoming_exhibits
        DamExhibitInfo::Exhibit.all_by_status("upcoming").each.with_index(1) {|exhibit, index| puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
        puts "\n==============================================================="
        
        input = gets.to_i
        selection = DamExhibitInfo::Exhibit.all[input - 1]
        puts ""
        puts DamExhibitInfo::Exhibit.upcoming_exhibit_description(selection)
        menu_options
    end

    # def exhibit_details
    #     input = gets.to_i
    #     selection = DamExhibitInfo::Exhibit.all[input - 1]
    #     puts ""
    #     puts DamExhibitInfo::Exhibit.exhibit_description(selection)
    #     menu_options
    # end
end 