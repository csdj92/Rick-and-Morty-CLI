class Cli  
    def call
        puts""
        puts "To view all characters from Rick and Morty, type 'list characters'"
        puts ""
        puts "TO view all the loctaions that are featured in the show type 'location'"
        puts ""
        input = gets.chomp
        binding.pry

        if input.downcase == "list characters"
            list_characters
        end
    end

    def main_menu_selection 
        
    end




    def list_characters
        Character.all.each.with_index(1) {|c, i| puts "#{i}.) #{c.name}"}
    end 
end