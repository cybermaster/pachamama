require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { 
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
  end
  
  describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

end

describe "Users as admins" do
  describe "testing the functionalities to add admins" do
    before :each do  
      admin = User.create!(Factory(:user))
      ad_role = Role.create!(Factory(:role, :name => "admin"))
      ad_role.users << admin
      new_ad = Factory(:user, :login => "jess", :name => "Jessica", :password => "Ho")
    end
    it "should add an admin" do
      User.should_receive(:find_by_login).with(new_ad.login).and_return(nil)
      error = admin.add_admin(new_ad.login, new_ad.name, new_ad.password)
      
      error.should == false
      
      added_ad = User.find_by_login(new_ad.login)
      
      #check whether we add the correct info for the table captain
      added_ad.login.should == new_ad.login
      added_ad.name.should == new_ad.name
      added_ad.password.should == new_ad.password
      added_ad.role?("admin").should == true
    end
    
    it "should not add an admin if the login already exists" do
      User.should_receive(:find_by_login).with(new_ad.login).and_return(nil)
      error = admin.add_admin(new_ad.login, new_ad.name, new_ad.password)
      
      error.should == false
      
      ad2 = Factory(:User, :name => "Brian", :password => "lin")
      
      User.should_receive(:find_by_login).with(ad2.login).and_return(new_ad)
      error = admin.add_table_captain(ad2.login, ad2.name, ad2.password)
      
      error.should == true
      
      old_ad = User.find_by_login(new_ad.login)
      
      #check whether we add the correct info for the table captain
      old_ad.login.should == new_ad.login
      old_ad.name.should == new_ad.name
      old_ad.password.should == new_ad.password
      old_ad.role?("admin").should == true
      old_ad.name.should.not == ad2.name
      old_ad.password.should.not == ad2.password
    end
  end
end

describe "as table captains" do
  describe "add a table captain" do
    before :each do  
      admin = User.create!(Factory(:user))
      ad_role = Role.create!(Factory(:role, :name => "admin"))
      ad_role.users << admin
      tc = Factory(:user, :login => "jess", :name => "Jessica", :password => "Ho")
      tc_role = Role.create!(Factory(:role, :name => "tableCaptain"))
      tc_role.users << tc
    end
    it "should add a table captain" do
      User.should_receive(:find_by_login).with(tc.login).and_return(nil)
      error = admin.add_table_captain(tc.login, tc.name, tc.password)
      
      error.should == false
      
      new_tc = User.find_by_login(tc.login)
      
      #check whether we add the correct info for the table captain
      new_tc.login.should == tc.login
      new_tc.name.should == tc.name
      new_tc.password.should == tc.password
      new_tc.role?("admin").should == false
      new_tc.role?("tableCaptain").should == true
    end
    
    it "should not add a table captain if the login already exists" do
      User.should_receive(:find_by_login).with(tc.login).and_return(nil)
      error = admin.add_table_captain(tc.login, tc.name, tc.password)
      
      error.should == false
      
      tc2 = Factory(:user, :first_name => "Adrian", :password => "wei")
      
      User.should_receive(:find_by_login).with(tc2.login).and_return(tc)
      error = admin.add_table_captain(tc2.login, tc2.name, tc2.password)
      
      error.should == true
      
      old_tc = User.find_by_login(tc.login)
      
      #check whether we add the correct info for the table captain
      old_tc.login.should == tc.login
      old_tc.name.should == tc.name
      old_tc.password.should == tc.password
      old_tc.role?("admin").should == false
      old_tc.role?("tableCaptain").should == true
      old_tc.name.should.not == tc2.name
      old_tc.password.should.not == tc2.password
    end
    
    it "should edit a table captain by admin" do
      User.should_receive(:find_by_login).with(tc.login).and_return(nil)
      error = admin.add_table_captain(tc.login, tc.name, tc.password)
      
      error.should == false
      
      tc2 = Factory(:user, :first_name => "Adrian", :password => "wei")
      
      User.should_receive(:find_by_login).with(tc2.login).and_return(tc)
      admin.edit_table_captain(tc2.login, tc2.name, tc2.password)
      
      new_tc = User.find_by_login(tc2.login)
      
      #check whether we add the correct info for the table captain
      new_tc.login.should == tc2.login
      new_tc.name.should == tc2.name
      new_tc.password.should == tc2.password
    end
    
    it "should edit a table captain by itself" do
      User.should_receive(:find_by_login).with(tc.login).and_return(nil)
      error = admin.add_table_captain(tc.login, tc.name, tc.password)
      
      error.should == false
      
      tc2 = Factory(:user, :first_name => "Adrian", :password => "wei")
      
      User.should_receive(:find_by_login).with(tc2.login).and_return(tc)
      tc.edit(tc2.name, tc2.password)
      
      new_tc = User.find_by_login(tc.login)
      
      #check whether we add the correct info for the table captain
      new_tc.login.should == tc2.login
      new_tc.name.should == tc2.name
      new_tc.password.should == tc2.password
    end
  end
end

