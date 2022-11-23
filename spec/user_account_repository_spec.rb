require "user_account_repository"

def reset_user_accounts_table
  seed_sql = File.read("spec/seeds_user_accounts.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "social_network_test" })
  connection.exec(seed_sql)
end

RSpec.describe UserAccountRepository do
  before(:each) do
    reset_user_accounts_table
  end

  describe "#all" do
    it "returns an array of UserAccount objects" do
      repo = UserAccountRepository.new
      users = repo.all
      expect(users.class).to eq Array
      all_users = users.all? { |el| el.class == UserAccount }
      expect(all_users).to eq true
    end
    it "the returned array has length 2" do
      repo = UserAccountRepository.new
      users = repo.all
      expect(users.length).to eq 2
    end
    it "has the correct data for first record" do
      repo = UserAccountRepository.new
      user_1 = repo.all.first
      expect(user_1.email_address).to eq "trump@trumptowers.com"
      expect(user_1.username).to eq "Zeus"
      expect(user_1.id).to eq 1
    end
  end

  describe "#find" do
    it "returns nil for id that is not in table" do
      repo = UserAccountRepository.new
      expect(repo.find(4)).to eq nil
    end
    it "returns correct data for record with id 1" do
      repo = UserAccountRepository.new
      user_1 = repo.find(1)
      expect(user_1.id).to eq 1
      expect(user_1.email_address).to eq "trump@trumptowers.com"
      expect(user_1.username).to eq "Zeus"
    end
  end

    describe "#create" do
      it "can find new record via the id being 3" do
        repo = UserAccountRepository.new
        new_user = double :fake_post, username: "third post", email_address: "randomwords@universe.com", number_of_views: 344, user_account_id: 1
        repo.create(new_user)
        user_3 = repo.find(3)
        expect(user_3.username).to eq "third post"
        expect(user_3.email_address).to eq "randomwords@universe.com"
        expect(user_3.id).to eq 3
      end
    end

    describe "#delete" do
      it "can't find a record after it deletes a record" do
        repo = UserAccountRepository.new
        repo.delete(1)
        users = repo.all
        expect(users.length).to eq 1
        expect(repo.find(1)).to eq nil
        expect(repo.find(2).class).to eq UserAccount
      end
    end
end
