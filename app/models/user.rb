class User < ApplicationRecord
  has_many :follows, dependent: :destroy
  has_many :following, through: :follows
  validates_presence_of :name
end
