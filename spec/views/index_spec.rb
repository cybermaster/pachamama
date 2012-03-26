require 'spec_helper'

describe "index.html.haml" do
  it "should show the add table captain button when the user is an admin" do
    admin = Factory(:admin)
    
    render
    rendered.should contain("Add Table Captain")
  end
  
  it "should not show the add table captain button when the user is not an admin" do
    tc = Factory(:tableCaptain)
    
    render
    rendered.should.not contain("Add Table Captain")
  end
  it "should show the add table button when the user is an admin" do
    admin = Factory(:admin)
    
    render
    rendered.should contain("Assign Table")
  end
  
  it "should not show the add table button when the user is not an admin" do
    tc = Factory(:tableCaptain)
    
    render
    rendered.should.not contain("Assign Table")
  end
end
