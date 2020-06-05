class Comment < ApplicationRecord
	validates :commenter, presence: true
	belongs_to :article

end
