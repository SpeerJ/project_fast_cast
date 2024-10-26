class ActorFunctionality < ApplicationRecord
  belongs_to :actor, foreign_key: :user_type_id
end
