class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness: true
	# validates :email
	has_many :articles
end
