require 'spec_helper'

describe User do
	before (:each) do
		@user = User.new(
			name: "Joe Bloggs",
			username: "Joe_Bloggs",
			email: "joe_bloggs@example.com",
			password: "password",
			password_confirmation: "password"
			)	
	end

  it "must have a name" do
    @user = User.new(:name => "")
    @user.should_not be_valid
  end

  it "must have a email" do
  	@user = User.new(:email => "")
  	@user.should_not be_valid
  end
  
  it "must have a username" do
  	@user = User.new(:username => "")
  	@user.should_not be_valid
  end

  it "must have a password" do
  	@user = User.new(:password => "")
  	@user.should_not be_valid
  end

  it "must have a password confirmation" do
  	@user = User.new(:password_confirmation => "")
  	@user.should_not be_valid
  end

  it "must contain a '@' in the email" do
  	@user.email.should include("@")
 end

  it "must contain a '.'' in the email" do
  	@user.email.should include(".")
 end

  it "should reject long names" do
	@user.name = "a" *26
	@user.should_not be_valid
 end

  it "should reject long user names" do
	@user.username = "a" * 26
	@user.should_not be_valid
 end
  it "should reject long emails" do
	@user.email = "a" *254
	@user.should_not be_valid
 end

  it "should reject passwords over 256 chars" do
	@user.email = "a" *256
	@user.should_not be_valid
 end

   it "should reject password confirmations over 256 chars" do
	@user.email = "a" *256
	@user.should_not be_valid
 end
end