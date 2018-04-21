class Campaign < ApplicationRecord
  belongs_to :user
  has_many :todos, dependent: :destroy
  has_many :comments, as: :commentable
  TAGS = %w(tag1 tag2 tag3 tag4 tag5 tag6 tag7 tag8).freeze
  serialize :tags
end
