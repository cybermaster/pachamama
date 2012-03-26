require 'spec_helper'

describe AdminController do
  describe "testing the functionalities to add and edit table captains" do
    it "should add a table captain into the database" do
      @message = {:login => "andrian@stern.com", :name => "Ad", :password => "not-a-secret"}
      #get :index
      #response.should not =~ /#{@message.login}/
      
      Admin.should_receive(:add_table_captain).and_return(false)
      
      post :add_tc, {:login => @message.login, :name => @message.name, :password => @message.password}
      
      response.should redirect_to :index
      #response.should =~ /#{@message.login}/
    end
    it "should edit a table captain into the database" do
      @message = {:login => "andrian@stern.com", :name => "Ad", :password => "not-a-secret"}
      #get :index
      #response.should not =~ /#{@message.login}/
      
      Admin.should_receive(:add_table_captain).and_return(false)
      
      post :add_tc, {:login => @message.login, :name => @message.name, :password => @message.password}
      
      
      @message2 = {:login => "andrian@stern.com", :name => "Ad Hoc", :password => "no-secret"}
      #get :index
      #response.should not =~ /#{@message.login}/
      
      Admin.should_receive(:edit_table_captain).and_return(false)
      
      post :edit_tc, {:login => @message2.login, :name => @message2.name, :password => @message2.password}
      
      response.should redirect_to :index
      #response.should =~ /#{@message.login}/
    end
  end
  
  describe "testing table assignments" do
    before :each do  
      admin = Factory(:admin, :id => 234)
      tc = Factory(:tableCaptain, :id => 345)
    end
    it "should assign a table to a table captain" do   
      tableNum = 999
      groupNum = 876 
      Admin.should_receive(:assign_table)
      
      post :assign_table, {:admin_id => admin.id, :tableCaptain_id => tc.id, :tableNumber => tableNum, :groupNumber => groupNum}
      
      response.should redirect_to :index
    end
  end
end
