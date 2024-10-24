class Project < ApplicationRecord
  belongs_to :casting_director, foreign_key: :user_type_id
  has_many :castings

end
