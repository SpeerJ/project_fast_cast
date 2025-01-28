class CastingDirector < UserType
  belongs_to :user
  has_many :castings, foreign_key: :user_type_id
  has_many :projects, foreign_key: :user_type_id

  delegate :name, to: :user

end