class Service < ActiveRecord::Base
  belongs_to :user
  belongs_to :driver, :class_name => 'User'
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :addr_from, presence: true
  validates :addr_to, presence: true
end

