class Character
    attr_accessor :id, :name, :status, :species, :gender
    
    @@all = []

    def initialize(attr_hash)
        attr_hash.each do |k,v|
          self.send(("#{k}="), v) if self.respond_to?(("#{k}="))        
        end
        save
      end
      
      def save
        @@all << self          
      end

    def self.all
       @@all        
    end
end