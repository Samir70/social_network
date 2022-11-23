require "post"

RSpec.describe Post do
    it "initialises from a hash" do
        new_post = {"id"=>"1", "title"=>"first post", "number_of_views"=>"45", "contents"=>"Random workds", "user_account_id"=>"4"}
        post = Post.new(new_post)
        expect(post.id).to eq 1
        expect(post.title).to eq "first post"
        expect(post.number_of_views).to eq 45
        expect(post.contents).to eq "Random workds"
        expect(post.user_account_id).to eq 4
    end
end