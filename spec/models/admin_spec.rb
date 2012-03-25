require 'spec_helper'

describe Admin do
  describe "testing the functionalities to add admins" do
    before :each do  
      admin = Factory(:admin)
      new_ad = Factory(:admin, :login => "jess", :name => "Jessica", :password => "Ho")
    end
    it "should add an admin" do
      Admin.should_receive(:find_by_login).with(new_ad.login).and_return(nil)
      error = admin.add_admin(new_ad.login, new_ad.name, new_ad.password)
      
      error.should == false
      
      added_ad = Admin.find_by_login(new_ad.login)
      
      #check whether we add the correct info for the table captain
      added_ad.login.should == new_ad.login
      added_ad.name.should == new_ad.name
      added_ad.password.should == new_ad.password
    end
    
    it "should not add an admin if the login already exists" do
      Admin.should_receive(:find_by_login).with(new_ad.login).and_return(nil)
      error = admin.add_admin(new_ad.login, new_ad.name, new_ad.password)
      
      error.should == false
      
      ad2 = Factory(:Admin, :name => "Brian", :password => "lin")
      
      Admin.should_receive(:find_by_login).with(ad2.login).and_return(new_ad)
      error = admin.add_table_captain(ad2.login, ad2.name, ad2.password)
      
      error.should == true
      
      old_ad = Admin.find_by_login(new_ad.login)
      
      #check whether we add the correct info for the table captain
      old_ad.login.should == new_ad.login
      old_ad.name.should == new_ad.name
      old_ad.password.should == new_ad.password
      old_ad.name.should not == ad2.name
      old_ad.password.should not == ad2.password
    end
  end
end
