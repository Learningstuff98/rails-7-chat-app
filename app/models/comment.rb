class Comment < ApplicationRecord
  belongs_to :chatroom
  broadcasts_to :chatroom
end
