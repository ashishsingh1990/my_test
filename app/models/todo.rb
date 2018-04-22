class Todo < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  belongs_to :campaign
  has_many :comments, as: :commentable
end
