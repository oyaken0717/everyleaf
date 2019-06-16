class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :limit, presence: true
end
