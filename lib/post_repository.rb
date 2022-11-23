require_relative "post"

class PostRepository
    def all
        sql = "SELECT * FROM posts"
        results = DatabaseConnection.exec_params(sql, []).map { |el| Post.new(el) }
        return results
    end
    
    def find(id)
        sql = "SELECT * FROM posts WHERE id = $1"
        results = DatabaseConnection.exec_params(sql, [id]).map { |el| Post.new(el) }
        return results[0]
    end

    def create(post) #post is a Post object
        sql = "INSERT INTO posts (title, contents, number_of_views, user_account_id) VALUES ($1, $2, $3, $4)"
        DatabaseConnection.exec_params(sql, [post.title, post.contents, post.number_of_views, post.user_account_id])
        return nil
    end

    def delete(id)
        sql = "DELETE FROM posts WHERE id = $1"
        DatabaseConnection.exec_params(sql, [id])
        return nil
    end
end