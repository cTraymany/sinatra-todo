class User < ActiveRecord::Base
    has_many :tasks
    has_secure_password
    validates_uniqueness_of :username, :email
    validates_presence_of :username, :email, :password
end
