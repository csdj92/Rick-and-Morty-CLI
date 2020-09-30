class Cli  
   
    def call
        system("clear")
        banner
        sleep(1.0)
        load
        main_menu_start     
    end

    def main_menu_start
        puts "To view all characters from Rick and Morty, type 'list characters'".blue.underline
        puts ""
        puts "To view all the loctaions that are featured in the show, type 'location'".blue.underline
        puts ""
        puts "To exit, type exit".red

        main_menu
        
    end

    def main_menu 
          input = gets.chomp.downcase
          show_me_what_you_got
          if input.downcase == "list characters"            
            list_characters
            second_menu
          elsif input.downcase == "location"
            location_menu
          elsif input.downcase == "exit"
            exit_prompt
            exit
          else
            invalid
            main_menu_start
        end
    end

    def second_menu
        character_selection_prompt
        id = valid_id?(prompt)
        character = Character.find_by_id(id)
        character_details(character)
        go_back
        back?(prompt)
        main_menu_start
        main_menu
    end

    def location_menu
        list_locations  
        character_selection_prompt 
        id = valid_id?(prompt)
        location = Location.find_by_id(id) 
        location_details(location)     
        go_back
        back?(prompt)
        main_menu_start  
        main_menu                
    end
    
    def load
        puts ''
        puts "Aw geez geez, let me get things cleaned up in here.. ".red
        puts ""
        Api.get_characters
        Api.get_locations
        puts "All done Rick!".blue
        puts ""
   end

    def character_selection_prompt
        puts "Please choose a number for more info."        
    end

    def prompt
        gets.chomp
    end 

    def back?(prompt)
        if prompt == "y"
            system("clear")
            main_menu_start
            main_menu
        elsif prompt == "n"      
            exit_prompt
            sleep(0.7)
            exit
        end
    end   

    def go_back
        puts "Continue the journey with Rick and Morty? (y/n)"
    end

    def exit_prompt
        system("clear")
        sleep (0.5)
        puts "Somthing clever from the show"
        puts "Come again soon!"
        exit    
    end
    
    def valid_id?(id)
        id = id.to_i
        if id < 1 || id > Character.all.size 
            invalid
            list_characters
            main_menu
        end
        id
    end

    def list_characters
        Character.all.each.with_index(1) {|c, i| puts "#{i}.) #{c.name}".green}
    end 
    
    def list_locations
        Location.all.each.with_index(1) {|l, i| puts "#{i}.) #{l.name}".green}
    end    
    
    
   def character_details(character)
    puts "Id: #{character.id}"
    puts "Name: #{character.name}"
    puts "Status: #{character.status}"
    puts "Species: #{character.species}"
    puts "Gender: #{character.gender}"
    puts "Location: #{character.location}"     
   end

   def location_details(location)
    puts ""
    puts "Name: #{location.name}"
    puts "Type: #{location.type}"
    puts "Dimension: #{location.dimension}"
    puts""
   end


   def invalid
   system("clear")
   puts "Unacceptable! Please put a valid response.".red.bold
   puts""
    
    end

   def banner
    puts"
######                                             #     #                           
#     # #  ####  #    #      ##   #    # #####     ##   ##  ####  #####  ##### #   # 
#     # # #    # #   #      #  #  ##   # #    #    # # # # #    # #    #   #    # #  
######  # #      ####      #    # # #  # #    #    #  #  # #    # #    #   #     #   
#   #   # #      #  #      ###### #  # # #    #    #     # #    # #####    #     #   
#    #  # #    # #   #     #    # #   ## #    #    #     # #    # #   #    #     #   
#     # #  ####  #    #    #    # #    # #####     #     #  ####  #    #   #     #  ".green
    end 
    
    def show_me_what_you_got
        puts" 
                ___          
            . -^   `--,      
           /# =========`-_   
          /# (--====___====\ 
         /#   .- --.  . --.| 
        /##   |  * ) (   * ),
        |##   \    /\ \   / |
        |###   ---   \ ---  |
        |####      ___)    #|
        |######           ##|
         \##### ---------- / 
          \####           (  
           `\###          |  
             \###         |  
              \##        |   
               \###.    .)   
                `======/  
                
        SHOW ME WHAT YOU'VE GOT
                ".magenta
                sleep(1.5)
        
    end
    


end






