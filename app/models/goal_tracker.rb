class GoalTracker < ApplicationRecord
    has_one :goal
    validates :occurrence_at, presence: true
end
