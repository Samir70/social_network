require "post_repository"

def reset_posts_table
  seed_sql = File.read("spec/seeds_posts.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "social_network_test" })
  connection.exec(seed_sql)
end

RSpec.describe PostRepository do
  before(:each) do
    reset_posts_table
  end

  describe "#all" do
    it "returns an array of Post objects" do
      repo = PostRepository.new
      posts = repo.all
      expect(posts.class).to eq Array
      all_posts = posts.all? { |el| el.class == Post }
      expect(all_posts).to eq true
    end
    it "the returned array has length 2" do
      repo = PostRepository.new
      posts = repo.all
      expect(posts.length).to eq 2
    end
    it "has the correct data for first record" do
      repo = PostRepository.new
      post_1 = repo.all.first
      expect(post_1.title).to eq "first post"
      expect(post_1.contents).to eq "random words"
      expect(post_1.number_of_views).to eq 34
      expect(post_1.user_account_id).to eq 2
    end
  end

  describe "#find" do
    it "returns nil for id that is not in table" do
      repo = PostRepository.new
      expect(repo.find(4)).to eq nil
    end
    it "returns correct data for record with id 1" do
      repo = PostRepository.new
      post_1 = repo.find(1)
      expect(post_1.id).to eq 1
      expect(post_1.title).to eq "first post"
      expect(post_1.contents).to eq "random words"
      expect(post_1.number_of_views).to eq 34
      expect(post_1.user_account_id).to eq 2
    end
  end

  describe "#create" do
    it "can find new record via the id being 3" do
      repo = PostRepository.new
      new_post = double :fake_post, title: "third post", contents: "more random words", number_of_views: 344, user_account_id: 1
      repo.create(new_post)
      post_1 = repo.find(3)
      expect(post_1.title).to eq "third post"
      expect(post_1.contents).to eq "more random words"
      expect(post_1.number_of_views).to eq 344
      expect(post_1.user_account_id).to eq 1
    end
  end

  describe "#delete" do
    it "can't find a record after it deletes a record" do
      repo = PostRepository.new
      repo.delete(1)
      posts = repo.all
      expect(posts.length).to eq 1
      expect(repo.find(1)).to eq nil
      expect(repo.find(2).class).to eq Post
    end
  end
end
