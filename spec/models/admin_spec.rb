################################
# NEED TO BE FIXED
# SHOULD ADD ADMIN, NOT TC!!!!!
################################

require 'spec_helper'

describe Admin do
  describe "add a table cpatain" do
    before :each do  
      admin = Factory(:admin)
      tc = Factory(:tableCaptain)
    end
    it "should add a table captain" do
      TableCaptain.should_receive(:find_by_login).with(tc.login).and_return(nil)
      error = admin.add_table_captain(tc.login, tc.name, tc.password)
      
      error.should == false
      
      new_tc = TableCaptain.find_by_login(tc.login)
      
      #check whether we add the correct info for the table captain
      new_tc.login.should == tc.login
      new_tc.name.should == tc.name
      new_tc.password.should == tc.password
    end
    
    it "should not add a table captain if the login already exists" do
      TableCaptain.should_receive(:find_by_login).with(tc.login).and_return(nil)
      error = admin.add_table_captain(tc.login, tc.name, tc.password)
      
      error.should == false
      
      tc2 = Factory(:tableCaptain, :name => "Adrian", :password => "wei")
      
      TableCaptain.should_receive(:find_by_login).with(tc2.login).and_return(tc)
      error = admin.add_table_captain(tc2.login, tc2.name, tc2.password)
      
      error.should == true
      
      old_tc = TableCaptain.find_by_login(tc.login)
      
      #check whether we add the correct info for the table captain
      old_tc.login.should == tc.login
      old_tc.name.should == tc.name
      old_tc.password.should == tc.password
      old_tc.name.should not == tc2.name
      old_tc.password.should not == tc2.password
    end
  end
end
