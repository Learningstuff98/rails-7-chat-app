class Comment < ApplicationRecord
  belongs_to :chatroom
  broadcasts_to :chatroom
  validates :content, presence: true
end
