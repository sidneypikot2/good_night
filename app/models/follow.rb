class Follow < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :following, class_name: 'User', foreign_key: 'followed_id', required: true

  validates :user_id, uniqueness: {
    scope: [ :followed_id ], message: "You already followed this user"
  }
end
