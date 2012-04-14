require 'spec_helper'

describe Event do
  describe "Creating events" do
    before :each do  
      admin = User.create!(Factory(:user))
      ad_role = Role.create!(Factory(:role, :name => "admin"))
      ad_role.users << admin
      tc = User.create!(Factory(:user, :login => "jess", :name => "Jessica", :password => "Ho"))
      tc_role = Role.create!(Factory(:role, :name => "tableCaptain"))
      tc_role.users << tc
      event = Factory(:event)
    end
    it "should be created by admins, not by others" do
      Event.should_receive(:create!)
      success = admin.create_event(event)
      success.should == true
      
      
      Event.should_not_receive(:create!)
      success = tc.create_event(event)
      success.should == false
    end
    it "should accept table captains by admins, not by table captains" do
      success = event.add_tc(admin, tc)
      success.should == true
      
      success = event.add_tc(tc, tc)
      success.should == false
    end
  end
end
