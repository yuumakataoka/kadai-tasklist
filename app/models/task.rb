class Task < ApplicationRecord
  validates :status, presence: true, length: { minimum: 1, maximum: 10 }
end
