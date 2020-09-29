class Cli  
  
   
   
    def call
        system("clear")

        puts""
        puts "To view all characters from Rick and Morty, type 'list characters'"
        puts ""
        puts "TO view all the loctaions that are featured in the show type 'location'"
        puts ""
        input = gets.chomp.downcase
        #binding.pry

        if input.downcase == "list characters"
            list_characters
        end
    end

    def main_menu_selection 
        
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