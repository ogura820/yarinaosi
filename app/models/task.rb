class Task < ApplicationRecord
  belongs_to :user
  validates :substance, presence: true
  validates :content, presence: true
  scope :search_by_substance, -> (serch_keyword){where('substance LIKE ?', "%#{serch_keyword}%")}
  scope :search_by_state_for_progress, -> (serch_progress){where(state_for_progress: serch_progress)}
  enum priority: { 高: 0, 中: 1, 低: 2 }
  scope :order_by_priority, -> {
    order_by = [] 
    CATEGORY_ORDERS.each { |category| order_by << "category=#{category} DESC" }
    order(order_by.join(", "))
}
end
