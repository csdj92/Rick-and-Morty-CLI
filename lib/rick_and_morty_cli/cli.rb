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

    



    def list_characters
        Character.all.each.with_index(1) {|c, i| puts "#{i}.) #{c.name}"}
    end 
    
    def load
    Api.get_characters
   end

   def banner
######                                             #     #                           
#     # #  ####  #    #      ##   #    # #####     ##   ##  ####  #####  ##### #   # 
#     # # #    # #   #      #  #  ##   # #    #    # # # # #    # #    #   #    # #  
######  # #      ####      #    # # #  # #    #    #  #  # #    # #    #   #     #   
#   #   # #      #  #      ###### #  # # #    #    #     # #    # #####    #     #   
#    #  # #    # #   #     #    # #   ## #    #    #     # #    # #   #    #     #   
#     # #  ####  #    #    #    # #    # #####     #     #  ####  #    #   #     #   
    


end