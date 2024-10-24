class ActorFunctionality < ApplicationRecord
  belongs_to :actor, foreign_key: :user_type_id
  has_many_attached :photos
end
