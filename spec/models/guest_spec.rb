require 'spec_helper'

describe Guest do
  describe "testing funcion: first_namelast_name" do
    it "should return the guest's first name and lastname" do
      @guest = Guest.create! :first_name => "Adrian", :last_name => "Stern"
      
      @name = @guest.first_namelast_name
      @name.should == "Adrian Stern"
    end
  end
end
