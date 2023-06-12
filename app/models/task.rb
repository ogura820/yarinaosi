class Task < ApplicationRecord
  belongs_to :user
  validates :substance, presence: true
  validates :content, presence: true
  #タスクの本文で絞り込み
  scope :search_by_substance, -> (serch_keyword){where('substance LIKE ?', "%#{serch_keyword}%")}
  #タスクのステータスで絞り込み
  scope :search_by_state_for_progress, -> (serch_progress){where(state_for_progress: serch_progress)}
  #タスクのラベルで絞り込み
  # scope :search_by_label, -> (label){where(labels: label)}whereで別テーブルはできない
  scope :search_by_label, -> (label) { joins(:labels).where(labels: { id: label }) }
  enum priority: { 高: 0, 中: 1, 低: 2 }
  scope :order_by_priority, -> {
    order_by = [] 
    CATEGORY_ORDERS.each { |category| order_by << "category=#{category} DESC" }
    order(order_by.join(", "))
  }
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
end
