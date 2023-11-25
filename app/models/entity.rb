class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :groups

  validates :author, presence: true
  validates :name, presence: true
  validates :groups, presence: true
  validates :amount, presence: true
end
