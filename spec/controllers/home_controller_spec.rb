require 'spec_helper'

describe HomeController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @ability.can :manage, :all
    controller.stub(:current_ability) { @ability }
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
