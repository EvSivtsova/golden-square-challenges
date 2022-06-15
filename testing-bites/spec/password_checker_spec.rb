require 'password_checker.rb'

RSpec.describe PasswordChecker do
  it "returns true when the password is equal to or longer than 8 characters ('character')" do
    password = PasswordChecker.new
    result = password.check("character") 
    expect(result).to eq true
  end

  it "error message if the password is shorter than 8 characters ('world')" do
    password = PasswordChecker.new
    expect { password.check("world")}.to raise_error "Invalid password, must be 8+ characters."
  end
end

