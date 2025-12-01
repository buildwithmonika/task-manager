class Task < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { maximum: 200 }
    validates :description, length: { maximum: 1000 }

    enum status: { pending: 0, in_progress: 1, completed: 2, archived: 3 }
end
