class Location
    attr_accessor :name, :type, :dimension

    @@all = []

    def initialize(attribute)
        attribute.each do |k,v|
          self.send(("#{k}="), v) #if self.respond_to?(("#{k}="))        
        end
        save
      end
      
      def save
        @@all << self          
      end

    def self.all
       @@all        
    end

    def self.find_by_id(id)
        index = id.to_i - 1
        @@all[index]
    end


end