require 'spec_helper'

describe GuestsController do
  before { controller.stub(:authenticate_user!).and_return true}
  before (:each) do
    @user = User.create!(
      :name => 'Test User',
      :email => 'example@example.com',
      :password => 'please',
      :password_confirmation => 'please')
    @dining_table = DiningTable.create! :group_number => 1
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @ability.can :manage, :all
    controller.stub(:current_ability) { @ability }
    controller.stub(:current_user) { @user }
  end

  def valid_attributes
    {:first_name=>"Steven",
     :last_name=>"Stern",
     :email=>"steven@steven.s",
     :dining_table_id => 1}
  end
  
  def valid_session
    {}
  end

  describe "GET show" do
    it "assigns the requested guest as @guests" do
      g = Guest.create! valid_attributes
      get :show, {:id => g.to_param}, valid_session
      assigns(:guest).should eq(g)
    end
  end

  describe "GET new" do
    it "assigns a new guest as @guests" do
      get :new, {}, valid_session
      assigns(:guest).should be_a_new(Guest)
    end
  end
  
  describe "GET edit" do
    it "assigns the requested guest as @guest" do
      g = Guest.create! valid_attributes
      get :edit, {:id => g.to_param}, valid_session
      assigns(:guest).should eq(g)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new guest" do
        expect {
          post :create, {:guest => valid_attributes}, valid_session
        }.to change(Guest, :count).by(1)
      end

      it "assigns a newly created guest as @guest" do
        post :create, {:guest => valid_attributes}, valid_session
        assigns(:guest).should be_a(Guest)
        assigns(:guest).should be_persisted
      end

      it "redirects to the created guest" do
        post :create, {:guest => valid_attributes}, valid_session
        response.should redirect_to(@dining_table)
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved guest as @guest" do
        # Trigger the behavior that occurs when invalid params are submitted
        Guest.any_instance.stub(:save).and_return(false)
        post :create, {:guest => {}}, valid_session
        assigns(:guest).should be_a_new(Guest)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Guest.any_instance.stub(:save).and_return(false)
        post :create, {:guest => {}}, valid_session
        response.should render_template("new")
      end
    end
  end
  
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested guest" do
        g = Guest.create! valid_attributes
        Guest.any_instance.should_receive(:update_attributes)
        put :update, {:id => g.to_param, :guest => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested guest as @guest" do
        g = Guest.create! valid_attributes
        put :update, {:id => g.to_param, :guest => valid_attributes}, valid_session
        assigns(:guest).should eq(g)
      end

      it "redirects to the guest" do
        g = Guest.create! valid_attributes
        put :update, {:id => g.to_param, :guest => valid_attributes}, valid_session
        response.should redirect_to(@dining_table)
      end
    end

    describe "with invalid params" do
      it "assigns the guest as @guest" do
        g = Guest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Guest.any_instance.stub(:save).and_return(false)
        put :update, {:id => g.to_param, :guest => {}}, valid_session
        assigns(:guest).should eq(g)
      end

      it "re-renders the 'edit' template" do
        g = Guest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Guest.any_instance.stub(:save).and_return(false)
        put :update, {:id => g.to_param, :guest => {}}, valid_session
        response.should render_template("edit")
      end
    end
    
    
  describe "DELETE destroy" do
    it "destroys the requested guest" do
      g = Guest.create! valid_attributes
      expect {
        delete :destroy, {:id => g.to_param}, valid_session
      }.to change(Guest, :count).by(-1)
    end

    it "redirects to the dining table" do
      g = Guest.create! valid_attributes
      delete :destroy, {:id => g.to_param}, valid_session
      response.should redirect_to(@dining_table)
    end
  end
  end
end
