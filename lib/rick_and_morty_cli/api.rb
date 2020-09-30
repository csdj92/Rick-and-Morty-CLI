class Api

    def self.get_characters
        n = 1
        character_array = []
        5.times do    
        url = "https://rickandmortyapi.com/api/character?page=#{n}"
        n +=1
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data["results"].each do |c| 
            #binding.pry
            Character.new(id: c["id"],name: c["name"],status: c["status"],species: c["species"],gender: c["gender"],location: c["location"].access("name."))
            character_array << data
          
          
             end
        end
        character_array
        #binding.pry
    end

    def self.get_locations
        url = "https://rickandmortyapi.com/api/location/"
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data["results"].each do |l|
            #binding.pry
            Location.new(name: l["name"], type: l["type"], dimension: l["dimension"])
        end
    end

end