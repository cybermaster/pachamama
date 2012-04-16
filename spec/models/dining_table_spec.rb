require 'spec_helper'

describe DiningTable do
  describe "assigning tables" do
    before :each do  
      admin = User.create!(FactoryGirl.create(:user))
      ad_role = Role.create!(FactoryGirl.create(:role, :name => "admin"))
      ad_role.users << admin
      tc = User.create!(FactoryGirl.create(:user, :login => "jess", :name => "Jessica", :password => "Ho"))
      tc_role = Role.create!(FactoryGirl.create(:role, :name => "tableCaptain"))
      tc_role.users << tc
      event = Event.create!(FactoryGirl.create(:event))
    end
    it "should assign a table to tc" do
      tableNum = 777
      groupNum = 123
      admin.assignTable(tc, event, tableNum, groupNum)
      
      table = tc.diningTables.find_by_tableNumber(tableNumber)
      table.groupNumber.should == groupNum
    end
    
    it "should not assign a table to tc with same table number" do
      tableNum = 777
      groupNum = 123
      admin.assignTable(tc, event, tableNum, groupNum)
      
      groupNum2 = 456
      admin.assignTable(tc, event, tableNum, groupNum2)
      
      table = tc.diningTables.find_by_tableNumber(tableNumber)
      table.groupNumber.should == groupNum
      table.groupNumber.should.not == groupNum2
    end
    
    
    it "should not assign a table to tc with same group number" do
      tableNum = 777
      groupNum = 123
      admin.assignTable(tc, event, tableNum, groupNum)
      
      tableNum2 = 111
      admin.assignTable(tc, event, tableNum2, groupNum)
      
      table = tc.diningTables.find_by_groupNumber(groupNum)
      table.tableNumber.should == tableNum
      table.tableNumber.should.not == tableNum2
    end
  end
end
