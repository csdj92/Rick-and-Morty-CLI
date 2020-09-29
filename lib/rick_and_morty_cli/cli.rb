class Cli  
  
   
   
    def call
        system("clear")
        banner
        #wait
        load
        main_menu_start

       # puts""
        #puts "To view all characters from Rick and Morty, type 'list characters'"
        #puts ""
        #puts "TO view all the loctaions that are featured in the show type 'location'"
        #puts ""
      
        #binding.pry

      
    end

    def main_menu_start
        puts "To view all characters from Rick and Morty, type 'list characters'"
        puts ""
        puts "To view all the loctaions that are featured in the show, type 'location'"
        puts ""
        puts "To exit, type exit"

        main_menu
        
    end

    def main_menu 
          input = gets.chomp.downcase

          if input.downcase == "list characters"
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
                "
                sleep(2.5)
            list_characters
            second_menu
          elsif input.downcase == "location"
            list_location
            go_back
            back?(promt_selection)
          elsif input.downcase == "exit"
            exit
          else
            invalid_selection
            main_menu_start
        end
    end

    def second_menu
        character_selection_prompt
        id=valid_id?(prompt)
        character = Character.find_by_id(id)
        character_details(character)
        go_back
        back?(promt_selection)
        main_menu_start
        main_menu
    end

    def character_selection_prompt
        puts "Please choose character by number for more info."        
    end
    def prompt
        gets.chomp
    end 

    def valid_id?(id)
        id = id.to_i
        if id < 1 || id > Character.all.size
            print_error
            sleep(1) 
            main_menu
        end
        id
    end

    def go_back
        puts "Continue the journey with Rick and Morty? (y/n)"
    end




    def list_characters
        Character.all.each.with_index(1) {|c, i| puts "#{i}.) #{c.name}"}
    end 
    
    def load
        puts ''
        puts "Aw geez geez, let me get things cleaned up in here.. "
        puts ""
        Api.get_characters
        puts "All done Rick!"
   end

   def character_details(character)

       
   end

   def banner
    puts"
######                                             #     #                           
#     # #  ####  #    #      ##   #    # #####     ##   ##  ####  #####  ##### #   # 
#     # # #    # #   #      #  #  ##   # #    #    # # # # #    # #    #   #    # #  
######  # #      ####      #    # # #  # #    #    #  #  # #    # #    #   #     #   
#   #   # #      #  #      ###### #  # # #    #    #     # #    # #####    #     #   
#    #  # #    # #   #     #    # #   ## #    #    #     # #    # #   #    #     #   
#     # #  ####  #    #    #    # #    # #####     #     #  ####  #    #   #     #  "
    end 
    


end






