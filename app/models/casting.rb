class Casting < ActiveRecord::Base
  belongs_to :casting_director, foreign_key: 'user_type_id'
end