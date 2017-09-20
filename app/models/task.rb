class Task < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :status, presence: true, length: { minimum: 1, maximum: 10 }
end
