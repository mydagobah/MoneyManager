class Money < ActiveRecord::Base
  attr_accessible :description, :value, :year, :month, :category
  belongs_to :user

  validates :description, presence: true, length: { maximum: 100 }
  validates :value, presence: true, numericality: true
  validates :user_id, presence: true

  # this ensures money records are ordered by create time descendingly
  default_scope order: 'money.created_at DESC'
end
