class Reaction < ApplicationRecord
  belongs_to :publication, optional: true
  belongs_to :user
  belongs_to :comment, optional: true
  Kinds = %w[like dislike not_interested neutral].freeze
  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta", "not_interested" => "No me interesa", "neutral" => "Neutral"}.freeze
end
