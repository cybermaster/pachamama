require "spec_helper"
require "cancan/matchers"

describe Ability do
  describe "initialize ability" do
    before(:each) do
      @user = User.create!(
        :name => 'Test User',
        :email => 'example@example.com',
        :password => 'please',
        :password_confirmation => 'please')
    end
    
    it "should create new user but no permission" do
      @ability = Ability.new(nil)
      
      @ability.should_not be_able_to(:create, User.new)
      @ability.should be_able_to(:read, User.new)
    end
    
    it "should create new user but no permission" do
      @user.stub(:role?).with(:admin).and_return true
      @ability = Ability.new(@user)
      
      @ability.should be_able_to(:create, User.new)
      @ability.should be_able_to(:read, User.new)
    end
  end  
end
