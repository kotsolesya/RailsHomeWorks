require 'rails_helper'

describe User do

  before { @user = User.new(first_name: "John", last_name: 'Batler', username: 'spring', password: 45454545, email: 'some@email1.com') }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:username) }
  it { should respond_to(:password) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when password is too short" do
   before { @user.password = "45" }
   it { should_not be_valid }
 end


 describe "when email format is invalid" do
     it "should be invalid" do
       addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
       addresses.each do |invalid_address|
         @user.email = invalid_address
         @user.should_not be_valid
       end
     end
   end

   describe "when email format is valid" do
     it "should be valid" do
       addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
       addresses.each do |valid_address|
         @user.email = valid_address
         @user.should be_valid
       end
     end
   end

end
