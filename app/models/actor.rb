class Actor < UserType
  has_one :actor_functionality, foreign_key: "user_type_id"
  belongs_to :user

  delegate :about_me, :city, to: :actor_functionality
  delegate :name, :photos,  to: :user

  def pfp
    @pfp ||= photos.first&.image
  end
end