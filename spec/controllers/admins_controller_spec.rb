require 'spec_helper'

describe Admin::AdminController do
  it "should add a table captain into the database" do
    @message = {:login => "andrian@stern.com", :name => "Ad", :password => "not-a-secret"}
    #get :index
    #response.should not =~ /#{@message.login}/
    
    TableCaptain.should_receive(:add_table_captain).and_return(false)
    
    post :add_tc, {:login => @message.login, :name => @message.name, :password => @message.password}
    
    response.should redirect_to :index
    #response.should =~ /#{@message.login}/
  end
  it "should edit a table captain into the database" do
    @message = {:login => "andrian@stern.com", :name => "Ad", :password => "not-a-secret"}
    #get :index
    #response.should not =~ /#{@message.login}/
    
    TableCaptain.should_receive(:add_table_captain).and_return(false)
    
    post :add_tc, {:login => @message.login, :name => @message.name, :password => @message.password}
    
    
    @message2 = {:login => "andrian@stern.com", :name => "Ad Hoc", :password => "no-secret"}
    #get :index
    #response.should not =~ /#{@message.login}/
    
    TableCaptain.should_receive(:edit_table_captain).and_return(false)
    
    post :edit_tc, {:login => @message2.login, :name => @message2.name, :password => @message2.password}
    
    response.should redirect_to :index
    #response.should =~ /#{@message.login}/
  end
end
