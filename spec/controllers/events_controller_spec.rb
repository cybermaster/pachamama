require 'spec_helper'

describe EventsController do
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
    @user.stub(:role?).and_return true
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    @ability.can :manage, :all
    controller.stub(:current_ability) { @ability }
    controller.stub(:current_user) { @user }
    #controller.stub(:authenticate_user!).and_return true
    #sign_in @user
  end

  def valid_attributes
    {:date=>"20120512",
     :location=>"cal"}
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all events as @events" do
      e = Event.create! valid_attributes
      get :index, {}, valid_session
      assigns(:events).should eq([e])
    end
  end
  
  describe "GET show" do
    it "assigns the requested event as @events" do
      e = Event.create! valid_attributes
      get :show, {:id => e.to_param}, valid_session
      assigns(:event).should eq(e)
    end
  end

  describe "GET new" do
    it "assigns a new event as @events" do
      get :new, {}, valid_session
      assigns(:event).should be_a_new(Event)
    end
  end
  
  describe "GET edit" do
    it "assigns the requested event as @event" do
      e = Event.create! valid_attributes
      get :edit, {:id => e.to_param}, valid_session
      assigns(:event).should eq(e)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new event" do
        expect {
          post :create, {:event => valid_attributes}, valid_session
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created role as @event" do
        post :create, {:event => valid_attributes}, valid_session
        assigns(:event).should be_a(Event)
        assigns(:event).should be_persisted
      end

      it "redirects to the created event" do
        post :create, {:event => valid_attributes}, valid_session
        response.should redirect_to("/")
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => {}}, valid_session
        assigns(:event).should be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => {}}, valid_session
        response.should render_template("new")
      end
    end
  end
  
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested event" do
        e = Event.create! valid_attributes
        # Assuming there are no other event in the database, this
        # specifies that the e created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Event.any_instance.should_receive(:update_attributes)
        put :update, {:id => e.to_param, :event => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested event as @event" do
        e = Event.create! valid_attributes
        put :update, {:id => e.to_param, :event => valid_attributes}, valid_session
        assigns(:event).should eq(e)
      end

      it "redirects to the event" do
        e = Event.create! valid_attributes
        put :update, {:id => e.to_param, :event => valid_attributes}, valid_session
        response.should redirect_to("/")
      end
    end

    describe "with invalid params" do
      it "assigns the role as @role" do
        e = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => e.to_param, :event => {}}, valid_session
        assigns(:event).should eq(e)
      end

      it "re-renders the 'edit' template" do
        e = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => e.to_param, :event => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end
end
