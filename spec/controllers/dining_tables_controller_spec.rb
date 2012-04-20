require 'spec_helper'

describe DiningTablesController do
  before { controller.stub(:authenticate_user!).and_return true}
  before (:each) do
    @user = User.create!(
      :name => 'Test User',
      :email => 'example@example.com',
      :password => 'please',
      :password_confirmation => 'please')
    #@user.stub(:role?).with('admin').and_return true
    #@ad_role = Role.create! :name => 'admin'
    #@ad_role.users << @user
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @ability.can :manage, :all
    controller.stub(:current_ability) { @ability }
    #controller.stub(:current_user) { @user }
    #controller.stub(:authenticate_user!).and_return true
    #sign_in @user
    @dummy_guest = Guest.create! :name=>"Steven", :dining_table_id=>"1"
    @dummy_event = Event.create! :date=>"20120512", :location=>"cal"
  end

  def valid_attributes
    {:physical_number => 25,
    :group_number => 20,
    :event_id => 1,
    :user_id => 1}
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all dining tables as @dining_tables" do
      dt = DiningTable.create! valid_attributes
      get :index, {}, valid_session
      assigns(:dining_tables).should eq([dt])
    end
  end
  
  describe "GET show" do
    it "assigns the requested dining table as @dining_tables" do
      dt = DiningTable.create! valid_attributes
      get :show, {:id => dt.to_param}, valid_session
      assigns(:dining_table).should eq(dt)
    end
  end

  describe "GET new" do
    it "assigns a new dining table as @dining_tables" do
      get :new, {}, valid_session
      assigns(:dining_table).should be_a_new(DiningTable)
    end
  end
  
  describe "GET edit" do
    it "assigns the requested dining table as @dining_table" do
      dt = DiningTable.create! valid_attributes
      get :edit, {:id => dt.to_param}, valid_session
      assigns(:dining_table).should eq(dt)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new dining table" do
        expect {
          post :create, {:dining_table => valid_attributes, :user => {:id => 1}, :event => {:id => 1}}, valid_session
        }.to change(DiningTable, :count).by(1)
      end

      it "assigns a newly created role as @dining_table" do
        post :create, {:dining_table => valid_attributes, :user => {:id => 1}, :event => {:id => 1}}, valid_session
        assigns(:dining_table).should be_a(DiningTable)
        assigns(:dining_table).should be_persisted
      end

      it "redirects to the created dining table" do
        post :create, {:dining_table => valid_attributes, :user => {:id => 1}, :event => {:id => 1}}, valid_session
        response.should redirect_to(DiningTable.last)
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved dining table as @dining_table" do
        # Trigger the behavior that occurs when invalid params are submitted
        DiningTable.any_instance.stub(:save).and_return(false)
        post :create, {:dining_table => {}, :user => {:id => 1}, :event => {:id => 1}}, valid_session
        assigns(:dining_table).should be_a_new(DiningTable)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DiningTable.any_instance.stub(:save).and_return(false)
        post :create, {:dining_table => {}, :user => {:id => 1}, :event => {:id => 1}}, valid_session
        response.should render_template("new")
      end
    end
  end
  
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested dining table" do
        dt = DiningTable.create! valid_attributes
        # Assuming there are no other dining table in the database, this
        # specifies that the DT created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DiningTable.any_instance.should_receive(:update_attributes)
        put :update, {:id => dt.to_param, :dining_table => {'these' => 'params'}, :user => {:id => 1}}, valid_session
      end

      it "assigns the requested dining table as @dining_table" do
        dt = DiningTable.create! valid_attributes
        put :update, {:id => dt.to_param, :dining_table => valid_attributes, :user => {:id => 1}}, valid_session
        assigns(:dining_table).should eq(dt)
      end

      it "redirects to the dining table" do
        dt = DiningTable.create! valid_attributes
        put :update, {:id => dt.to_param, :dining_table => valid_attributes, :user => {:id => 1}}, valid_session
        response.should redirect_to(dt)
      end
    end

    describe "with invalid params" do
      it "assigns the role as @role" do
        dt = DiningTable.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DiningTable.any_instance.stub(:save).and_return(false)
        put :update, {:id => dt.to_param, :dining_table => {}, :user => {:id => 1}}, valid_session
        assigns(:dining_table).should eq(dt)
      end

      it "re-renders the 'edit' template" do
        dt = DiningTable.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DiningTable.any_instance.stub(:save).and_return(false)
        put :update, {:id => dt.to_param, :dining_table => {}, :user => {:id => 1}}, valid_session
        response.should render_template("edit")
      end
    end
  end
end
