class Comment < ApplicationRecord
  belongs_to :publication
  belongs_to :users
  has_many :reactions, dependent: :destroy
end
