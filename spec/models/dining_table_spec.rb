require 'spec_helper'

describe DiningTable do
  describe "assigning tables" do
    before :each do  
      admin = Factory(:admin)
      tc = Factory(:tableCaptain)
    end
    it "should assign a table to tc" do
      tableNum = 777
      groupNum = 123
      admin.assignTable(tc, tableNum, groupNum)
      
      table = tc.diningTables.find_by_tableNumber(tableNumber)
      table.groupNumber.should == groupNum
    end
    
    it "should not assign a table to tc with same table number" do
      tableNum = 777
      groupNum = 123
      admin.assignTable(tc, tableNum, groupNum)
      
      groupNum2 = 456
      admin.assignTable(tc, tableNum, groupNum2)
      
      table = tc.diningTables.find_by_tableNumber(tableNumber)
      table.groupNumber.should == groupNum
      table.groupNumber.should.not == groupNum2
    end
    
    
    it "should not assign a table to tc with same group number" do
      tableNum = 777
      groupNum = 123
      admin.assignTable(tc, tableNum, groupNum)
      
      tableNum2 = 111
      admin.assignTable(tc, tableNum2, groupNum)
      
      table = tc.diningTables.find_by_groupNumber(groupNum)
      table.tableNumber.should == tableNum
      table.tableNumber.should.not == tableNum2
    end
  end
end
