class Article < ApplicationRecord
	validates :title, presence: true
	# validates :content, length: {minimum: 5}
	has_many :comments
	belongs_to :user

end