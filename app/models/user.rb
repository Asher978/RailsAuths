class User < ApplicationRecord

    attr_reader :password

    def is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password_attempt)
    end

    def password=(password)
        @password = raw_password
        self.password_digest = BCrypt::Password.create(raw_password)
    end
end
