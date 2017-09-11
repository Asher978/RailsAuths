class User < ApplicationRecord

    attr_reader :password

    def self.find_by_credentials(username, password)
        user.User.find_by(username: username)
        return nil unless user
        user if user.is_password?(password)
        # user.is_password?(password) ? user : nil
    end

    def is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password_attempt)
    end

    def password=(password)
        @password = raw_password
        self.password_digest = BCrypt::Password.create(raw_password)
    end
end
