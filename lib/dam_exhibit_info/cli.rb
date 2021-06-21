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
        end
    end

    # def previous_menu (was thinking i needed this if I can manage to scrape detailed info for each exhibit)
    #     # How will my code know what exhibits are the pervious menu?
    #     # current or upcoming?
    #     # will just need to go back one level
    # end

    def current_exhibits # this might need to go in the Exhibit class???
        puts "\nHere are the current exhibits at the Denver Art Museum\n"
        # puts "Select a number below for a detailed discription of the exhibit"
        puts "\n======================================================="
        DamExhibitInfo::Scraper.scrape_current_exhibits_index
        puts "\n==============================================================="
        # or input for current_exhibit_details 
        # (has to be a better way than writing case statements for each option...)
        # show_current_exhibit_details_for(chosen_exhibit) method ???
        menu_options
    end

    def upcoming_exhibits # this might need to go in the Exhibit class???
        puts "\nHere are the upcoming exhibits at the Denver Art Museum"
        # puts "Select a number below for a detailed discription of the exhibit"
        puts "\n==============================================================="
        DamExhibitInfo::Scraper.scrape_upcoming_exhibits_index
        puts "\n==============================================================="
        menu_options
        # or input = gets.strip for current_exhibit_details
        # would have to write a case statement for each option.... not ideal
    end

    # def show_current_exhibit_details_for(chosen_exhibit) ???
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