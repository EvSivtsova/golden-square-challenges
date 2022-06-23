require "contact"

describe Contact do
  context "when adding name and phone number" do
    it "adds the name and the number to the instance and returns it" do
      contact = Contact.new 
      contact.add("Alexandre Dumas", "02345678901")
      expect(contact.name).to eq "Alexandre Dumas" 
      expect(contact.phone_number).to eq "02345678901"
    end
  end

  context "when wrong phone number is provided" do
    it "fails when the number is contains letters or other symbols" do 
      contact = Contact.new  
      expect { contact.add("Alexandre Dumas", "345A7890") }.to raise_error "Phone number should be 11 digits and start with zero" 
    end
  end
end