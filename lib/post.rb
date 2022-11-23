class Post
    def initialize(hash)
        @id = hash["id"].to_i
        @title = hash["title"]
        @contents = hash["contents"]
        @number_of_views = hash["number_of_views"].to_i
        @user_account_id = hash["user_account_id"].to_i
    end
    attr_accessor :id, :title, :contents, :number_of_views, :user_account_id
end