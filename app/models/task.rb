class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :limit, presence: true

  # scope :search_title, -> (task_title) { where("title LIKE ?","%#{ task_title }%")}
  # scope :search_status, -> (task_status) { where(status: task_status)}

  enum priority:{"低":0,"中":1,"高":2}
end
