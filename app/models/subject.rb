class Subject < ApplicationRecord
    validates :title, presence: true
end
