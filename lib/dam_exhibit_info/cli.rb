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
        end
    end

    def menu_options
        puts "To go back to the root menu type 'menu'"
        puts "To exit the program type 'exit'"
        input = gets.strip

        case input
        when "menu"
            get_user_input
        when "exit"
            puts "\nHave a wonderful day filled with art!"
            puts ""
        end
    end

    def valid_selection?

    end
    
    def current_exhibits
        puts "\nHere are the current exhibits at the Denver Art Museum\n"
        puts "Select a number below for a detailed discription of the exhibit"
        puts "\n======================================================="
        puts ""
        DamExhibitInfo::Exhibit.make_current_exhibits
        DamExhibitInfo::Exhibit.all_by_status("current").each.with_index(1) {|exhibit, index| puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
        puts "\n==============================================================="
        # User will select a number relating to the event they want to see detailed description about
        # that selection should reference the link to that exhibit object's page
        # Will need to scrape links for each exhibit, then create an exhibit_details object from that data
        # then that object gets called when a user makes a selection
        # maybe create a CLI new method to handle this and call it here???
        input = gets.strip
        
        # if input.valid_selection? 
        #     input = 
        # end
        menu_options
    end

    def upcoming_exhibits # this might need to go in the Exhibit class???
        puts "\nHere are the upcoming exhibits at the Denver Art Museum"
        # puts "Select a number below for a detailed discription of the exhibit"
        puts "\n==============================================================="
        DamExhibitInfo::Exhibit.make_upcoming_exhibits
        DamExhibitInfo::Exhibit.all_by_status("upcoming").each.with_index(1) {|exhibit, index| puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
        puts "\n==============================================================="
        menu_options
        # or input = gets.strip for current_exhibit_details
        # would have to write a case statement for each option.... not ideal
    end

    # def current_exhibit_details_for(chosen_exhibit) ???
    #     # scrape details for each current exhibit and take into account
    #     # user input for specific exhibit selection
    #     menu_options
    # end

    # def upcoming_exhibit_details(chosen_exhibit) ???
    #     # scrape details for each upcoming exhibit and take into account
    #     # user input for specific exhibit selection
    #     menu_options
    # end 
end 