class Reaction < ApplicationRecord
  belongs_to :publication
  belongs_to :user
  belongs_to :comment
end
