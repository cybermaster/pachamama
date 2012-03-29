require 'spec_helper'

describe Admin do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @attr = { 
      :name => "Example Admin",
      :email => "admin@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Admin.create!(@attr)
  end
  
  it "should require an email address" do
    no_email_admin = User.new(@attr.merge(:email => ""))
    no_email_admin.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_admin = Admin.new(@attr.merge(:email => address))
      valid_email_admin.should be_valid
    end
  end
  
end
