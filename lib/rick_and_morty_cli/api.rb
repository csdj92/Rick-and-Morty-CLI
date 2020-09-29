class Api

    def self.get_character
        url = "https://rickandmortyapi.com/api/character/"
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data.each do |c|
            Character.new(c["id"], c["name"], c["status"], c["species"], c["gender"])
       binding.pry
        end
    end

    def self.get_locations
        url = "https://rickandmortyapi.com/api/location/"
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data.each do |l|
            Location.new(l["name"], l["type"], ["dimension"])
        end
    end

end