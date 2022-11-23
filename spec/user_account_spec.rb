require "user_account"

RSpec.describe UserAccount do
  it "initialises from a hash" do
    new_user = { "id" => "1", "username" => "first user", "email_address" => "me@here.com" }
    user = UserAccount.new(new_user)
    expect(user.id).to eq 1
    expect(user.username).to eq "first user"
    expect(user.email_address).to eq "me@here.com"
  end
end
