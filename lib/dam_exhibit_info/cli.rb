class DamExhibitInfo::CLI 
    def call
        # Welcome message
        # call method get_exhibits_for(input)
        # call method list_exhibits_for(input) (current or upcoming selection)
        puts ""
        puts ">>>>>>>>>  Welcome to the Denver Art Museum!  <<<<<<<<<"
        puts ""
        puts "Select a number below to see the current or upcoming exhibits at the Denver Art Museum:"
        puts ""
        puts "  1. Current Exhibits"
        puts "  2. Upcoming Exhibits"
        puts ""
        puts "  Type 'exit' to exit the program"
        
        input = gets.strip

        case input
        when "1"
            current_exhibits
        when "2"
            upcoming_exhibits
        when "exit"
            puts "Have a wonderful day filled with art!"
        end
    end

    def menu_options
        # puts "To go back to the root menu type 'previous'"
        puts "To go back to the previous menu type 'menu'"
        puts "To exit the program type 'exit'"
        input = gets.strip

        case input
        # when "previous"
        #     previous_menu
        when "root"
            root_menu
        end

        def root_menu
            call
        end

        # def previous_menu
        #     # How will my code know what exhibits are the pervious menu?
        #     # current or upcoming?
        #     # will just need to go back one level
        # end
    end

    def current_exhibits
        puts ""
        puts "Here are the current exhibits at the Denver Art Museum"
        puts ""
        # puts "Select a number below for a detailed discription of the exhibit"
        puts "======================================================="
        puts ""
        DamExhibitInfo::Scraper.scrape_current_exhibits_index
        puts ""
        puts "==============================================================="
        puts ""
        menu_options
        input = gets.strip
    end

    def upcoming_exhibits
        puts "Here are the upcoming exhibits at the Denver Art Museum"
        puts "Select a number below for a detailed discription of the exhibit"
        puts "==============================================================="
        DamExhibitInfo::Scraper.scrape_upcoming_exhibits_index
        puts "==============================================================="
        menu_options
        input = gets.strip
    end
end 