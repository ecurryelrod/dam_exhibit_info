class DamExhibitInfo::CLI 
    def call
        system("clear")
        puts "\n*********************************************************************"
        puts "|                                                                   |"
        puts "|    >>>  Welcome to the Denver Art Museum Exhibit Finder!  <<<     |"
        puts "|                                                                   |"
        puts "*********************************************************************"
        menu_options
    end

    def menu_options
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
            puts "\n****** Not a valid selection ******"
            menu_options
        end
    end

    def current_or_upcoming_exhibits(type)
        puts "\n=========================================================================================="
        puts "                Here are the #{type} exhibits at the Denver Art Museum"
        puts "\n             Select a number below for a detailed description of the exhibit"
        puts "                           To go back to the menu type 'menu'"
        puts "                             To exit the program type 'exit'"
        puts "=========================================================================================="
        puts ""
        display_exhibits(type)
    end

    def display_exhibits(type)
        DamExhibitInfo::Exhibit.all_exhibits_by_type(type).each.with_index(1) {|exhibit, index| 
            puts "#{index}. #{exhibit.name} - #{exhibit.date} - #{exhibit.summary}"}
        puts "\n==========================================================================================="
        exhibit_list_menu(type)
    end

    def exhibit_list_menu(type)
        input = gets.strip
        case input
        when "menu"
            menu_options
        when "exit"
            exit_program
        else 
            if input.to_i.between?(1, DamExhibitInfo::Exhibit.all_exhibits_by_type(type).length)
            # if valid_exhibit_selection(input.to_i, DamExhibitInfo::Exhibit.all_exhibits_by_type(type))
                exhibit_details(type, input)
            else
                puts "\n****** Not a valid selection ******"
                menu_options
            end
        end
    end

    # def valid_exhibit_selection(input, data)
    #     input.between?(1, data.length) ? input.to_i : nil
    # end

    def exhibit_details(type, input)
        selection = DamExhibitInfo::Exhibit.all_exhibits_by_type(type)[input.to_i - 1]
        puts ""
        puts DamExhibitInfo::Exhibit.exhibit_description(selection)
        menu_options
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
end   