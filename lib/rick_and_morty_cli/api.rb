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
            Character.new(id: c["id"],name: c["name"],status: c["status"],species: c["species"],gender: c["gender"],location: c["location"].access("name."))
            
            character_array << data
            end
        end
        character_array
    end

    def self.get_locations
        n = 1
        location_array = []
        5.times do 
            url = "https://rickandmortyapi.com/api/location?page=#{n}"
            n +=1
            response = RestClient.get(url)
            data = JSON.parse(response.body)
         data["results"].each do |l|
            Location.new(name: l["name"], type: l["type"], dimension: l["dimension"])

            location_array << data


        end
        end
        location_array
    end

end