class InterviewRequest < ApplicationRecord
  belongs_to :casting_director
  belongs_to :actor
end
