class DamExhibitInfo::CLI 
    def call
        puts "\n*********************************************************************"
        puts "|                                                                   |"
        puts "|    >>>  Welcome to the Denver Art Museum Exhibit Finder!  <<<     |"
        puts "|                                                                   |"
        puts "*********************************************************************"
        puts "\nSelect a number below to see current or upcoming exhibits:"
        puts "\n  1. Current Exhibits"
        puts "  2. Upcoming Exhibits"
        puts "\n  Type 'exit' to exit the program"
        
        input = gets.strip
        type = input == "1" ? "current" : "upcoming"
        
        case input 
        when "1", "2"
            current_or_upcoming_exhibits(type)
        when "exit"
            exit_program
        else
            puts "\n****** Not a valid selection ******"
            call
        end
    end

    def menu_options(type)
        puts "\nTo see Current Exhibits type 'c'"
        puts "To see Upcoming Exhibits type 'u'"
        puts "To exit the program type 'exit'"
        puts "\n===================================="
        puts ""
        
        input = gets.strip

        if input.to_i == 0 
            type = input == "c" ? "current" : "upcoming"
        end
        
        case input
        when "exit"
            exit_program
        when "c", "u"
            current_or_upcoming_exhibits(type)
        else
            if valid_input(input.to_i, DamExhibitInfo::Exhibit.all_exhibits_by_type(type))
                exhibit_details(type, input)
                binding.pry
            else
                puts "\n****** Not a valid selection ******"
                menu_options(type)
            end
        end
    end

    def valid_input(input, data)
        input.between?(1, data.length) ? input.to_i : nil
    end

    def current_or_upcoming_exhibits(type)
        puts "\n=========================================================================================="
        puts "                Here are the #{type} exhibits at the Denver Art Museum                 "
        puts "\n             Select a number below for a detailed description of the exhibit             "
        puts "=========================================================================================="
        puts ""
        display_exhibits(type)
    end

    def display_exhibits(type)
        DamExhibitInfo::Exhibit.make_exhibits
        DamExhibitInfo::Exhibit.all_exhibits_by_type(type).each.with_index(1) {|exhibit, index| puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
        puts "\n==========================================================================================="
        menu_options(type)
    end

    def exhibit_details(type, input)
        selection = DamExhibitInfo::Exhibit.all_exhibits_by_type(type)[input.to_i - 1]
        puts ""
        puts DamExhibitInfo::Exhibit.exhibit_description(selection)
        menu_options(type)
    end

    def exit_program
        puts "\n*********************************************************"
        puts "|                                                       |"
        puts "|    >>>  Have a wonderful day filled with art!  <<<    |"
        puts "|                                                       |"
        puts "*********************************************************"
        puts ""
        exit
    end
    
    
    
    
    
    
     # def get_user_input
    #     puts "\nSelect a number below to see current or upcoming exhibits:"
    #     puts "\n  1. Current Exhibits"
    #     puts "  2. Upcoming Exhibits"
    #     puts "\n  Type 'exit' to exit the program"
        
    #     input = gets.strip
        
    #     case input 
    #     when "1"
    #         current_or_upcoming_exhibits("current")
    #     when "2"
    #         current_or_upcoming_exhibits("upcoming")
    #     when "exit"
    #         exit_program
    #     else
    #         puts "\n****** Not a valid selection ******"
    #         get_user_input
    #     end
    # end

    # def current_or_upcoming_exhibits(type)
        # puts "\n=========================================================================================="
        # puts "                Here are the #{type} exhibits at the Denver Art Museum                 "
        # puts "\n             Select a number below for a detailed description of the exhibit             "
        # puts "=========================================================================================="
        # puts "" 
        # display_exhibits("current")
            # Exhibit.make_exhibits("current")
            # Exhibit.all_by_status("current").each.with_index(1) {|exhibit, index| puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
            # puts "\n==========================================================================================="
            # menu_options
            # exhibit_details("current")
        # display_exhibits("upcoming")
            # Exhibit.make_exhibits("upcoming")
            # Exhibit.all_by_status("upcoming").each.with_index(1) {|exhibit, index| puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
            # puts "\n==========================================================================================="
            # # menu_options
            # exhibit_details("upcoming")
    
    # def current_exhibits
    #     puts "\nHere are the current exhibits at the Denver Art Museum\n"
    #     puts "Select a number below for a detailed discription of the exhibit"
    #     puts "\n======================================================="
    #     puts ""
    #     DamExhibitInfo::Exhibit.make_exhibits("current")
    #     DamExhibitInfo::Exhibit.all_by_status("current").each.with_index(1) {|exhibit, index| puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
    #     puts "\n==============================================================="
    #     # valid_selection?
        
    #     # menu_options
    #     # input = gets.to_i
    #     # selection = DamExhibitInfo::Exhibit.all_by_status("current")[input - 1]
    #     # puts ""
    #     # puts DamExhibitInfo::Exhibit.exhibit_description(selection)
        
    #     # menu_options
    #     exhibit_details("current")
    #     menu_options
    # end

    # def upcoming_exhibits
    #     puts "\nHere are the upcoming exhibits at the Denver Art Museum"
    #     puts "Select a number below for a detailed discription of the exhibit"
    #     puts "\n==============================================================="
    #     puts ""
    #     DamExhibitInfo::Exhibit.make_exhibits("upcoming")
    #     DamExhibitInfo::Exhibit.all_by_status("upcoming").each.with_index(1) {|exhibit, index| puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
    #     puts "\n==============================================================="
        
    #     # menu_options
    #     # input = gets.to_i
    #     # selection = DamExhibitInfo::Exhibit.all_by_status("upcoming")[input - 1]
    #     # puts ""
    #     # puts DamExhibitInfo::Exhibit.exhibit_description(selection)
        
    #     menu_options
    #     exhibit_details("upcoming")
    #     # menu_options
    # end
end 