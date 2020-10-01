class Cli  
   
    def call
        system("clear")
        banner
        sleep(1.0)
        load
        main_menu_start     
    end

    def main_menu_start
        puts "To view all characters from Rick and Morty, type '1'".blue.underline
        puts ""
        puts "To view all the loctaions that are featured in the show, type '2'".blue.underline
        puts ""
        puts "To exit, type exit".red

        main_menu
        
    end

    def main_menu 
          input = gets.chomp.downcase
          show_me_what_you_got
          if input.downcase == "1"            
            list_characters
            character_menu
          elsif input.downcase == "2"
            location_menu
          elsif input.downcase == "exit"
            exit_prompt
            exit
          else
            invalid
            main_menu_start
        end
    end

    def character_menu
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
        puts "All done Rick!".green
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
        end_banner
        puts "Come again soon!"
        exit    
    end
    
    def valid_id?(id)
        id = id.to_i
        if id < 1 || id > Character.all.size 
            invalid
            character_menu
            location_menu
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
    puts ""
    puts "Id: #{character.id}"
    puts "Name: #{character.name}"
    puts "Status: #{character.status}"
    puts "Species: #{character.species}"
    puts "Gender: #{character.gender}"
    puts "Location: #{character.location}" 
    puts ""    
   end

   def location_details(location)
    puts ""
    puts "Name: #{location.name}"
    puts "Type: #{location.type}"
    puts "Dimension: #{location.dimension}"
    puts""
   end


   def invalid
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

    def end_banner
        puts "                                                                                          `-                                                                
        ``                                                                               .hd`                                                               
  `.`./ymmds:..                                                                 .+`     `mN-                                                                
:+dmmNMMMMMMMNm++-                                                             .dd     `oMs                                                                 
sNMMMMMNddmMMMMMMh   .`                                                     `..hM:    `hMM/                                                                 
`mMMM+/.``./oNMMMN: :mo`            /s+                                     hNmMMs    +MMMh                         `     ++                                
 mMMMo      `+NMMM/ sMN.            hMs      ..                            :MMMMMm   `dMMMN`           ``         `yy`    sN/                               
 .hMMm-      .NMMN- .++            `mMs   `:yy/                            hMNyMMM: .hMNMMM-           +y.oyo+`   sN/     mMd`                              
  sMMMy`    `yMMM+  -hh`    .oyoo/ /MMy`:shho.        -          -y`      /MMy-dMMh`hMMyyNMs    :yhy/` yNmNmMN/  :NM+     hMMh`                             
  /MMMM:  `-oMMMy`  /MN.  -smMd+/-`dMMmmNNs`        `+N- .   -.  dd`      yMMd .hMm-MMMs.NMd` -yNNMMN+ dMN+yMMm. yMm`     yMMM:       .:-                   
  .dMMMdysmNMNy+`   /Mm. `dMd+.   /dmMMd+-`        .hmNo`do`/N/ /Mm`      +MMs  :NN+MMd-sMMM.-mMdyNMMs`mMMmmds/-:NMs-``   -NMMo    ./yhs.                   
   /MMMMMMMMNs`     :NMs`+MMs     `-mMMd-          :Mhmm-NNdmN./mMs       sMM:   yMNMN. yMMM.sMN-`hMM+ +MMMm/ :sdMMmNdds:  yMMN+/shhy/.                     
   `dMMNymNMMMy+-`  `NM/-NMN/:/-.- :MNdNm+-`       sMymMdMhmMmddyMo     `sNMm`   /MMMd  /MMd`.NMh/hMMN.+MddMN.  -NM/:/os-  oMMMNMm/.                        
    dMMN..-sNmNMNd-  dN:`sdMNNNdys`/Mo`:mMN+      .Nh`:Nhd/-ddNhdNd`    .MMMh`   .oNN-  -NMh .dmMNMMd/ +M:.sNh` /MN.      .NMMds/.                          
    oMMM:   ..:dMMmo`sm   .mm/-``  hN.  /NMN-      s-  //`  ``:+/od-    `hMh.      yd    +NM. `./so/`  /y`  yN. :Mh`   `+ydNms`                             
    /MMN.      ./+NMs//    --     .d/    :NMs                     `      yMo        `    .NMy               :N+ -M/   -yNMy/.                               
    -mMMs         -ommo.           `      /NN-                           yMo             `yMh                :: +N.  `yMNo`                                 
     :NMd`          -sNd`                  om/                           sm`              .sN/                  :o `/dNd-                                   
     `dMm.            +Nh`                 `.                            .-                `yo                   .:dNmo.                                    
      .N/              /m:                                                                                    `-shhy+.``                                    
       -`               .`                                                                                    +h/`                                          
                                                                                                              `                                 "
    end
    


end






