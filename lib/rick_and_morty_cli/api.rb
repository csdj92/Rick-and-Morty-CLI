class Api

    def self.get_characters
        url = "https://rickandmortyapi.com/api/character/"
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data["results"].each do |c| 
            #binding.pry
            Character.new(id: c["id"],name: c["name"],status: c["status"],species: c["species"],gender: c["gender"])
           
        end
    end

    def self.get_locations
        url = "https://rickandmortyapi.com/api/location/"
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data.each do |l|
            binding.pry
            Location.new(l["name"], l["type"], ["dimension"])
        end
    end

end