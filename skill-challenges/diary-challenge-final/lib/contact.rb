class Contact
    def initialize
      @name 
      @phone_number
    end
  
    def add(name, phone_number)
      if phone_number.size == 11 && !phone_number.match?(/\D/) && phone_number[0] == "0"
        @phone_number = phone_number 
        @name = name 
      else
        fail  "Phone number should be 11 digits and start with zero" 
      end
    end
  
    def name
      return @name
    end

    def phone_number
      return @phone_number
    end
end 