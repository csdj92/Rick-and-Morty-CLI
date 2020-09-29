class Api



    def self.get_character
        url = "https://rickandmortyapi.com/api/character/"
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        data.each do |c|
            Character.new(c["char_id"], c["name"], c["birthday"], c["occupation"], c["nickname"], c["appearance"], c["portrayed"])
        end
    end
end