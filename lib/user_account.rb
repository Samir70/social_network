class UserAccount
    def initialize(hash)
        @id = hash["id"].to_i
        @email_address = hash["email_address"]
        @username = hash["username"]
    end
    attr_accessor :email_address, :username, :id
end