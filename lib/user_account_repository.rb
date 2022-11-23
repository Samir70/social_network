require_relative "user_account"

class UserAccountRepository
  def all
    sql = "SELECT * FROM user_accounts"
    results = DatabaseConnection.exec_params(sql, []).map { |el| UserAccount.new(el) }
    return results
  end

  def find(id)
    sql = "SELECT * FROM user_accounts WHERE id = $1"
    results = DatabaseConnection.exec_params(sql, [id]).map { |el| UserAccount.new(el) }
    return results[0]
  end

  def create(user) #user is a UserAccount object
    sql = "INSERT INTO user_accounts (email_address, username) VALUES ($1, $2)"
    DatabaseConnection.exec_params(sql, [user.email_address, user.username])
    return nil
  end

  def delete(id)
    sql = "DELETE FROM user_accounts WHERE id = $1"
    DatabaseConnection.exec_params(sql, [id])
    return nil
  end
end
