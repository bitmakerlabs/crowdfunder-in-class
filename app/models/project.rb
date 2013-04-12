class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges
  has_many :images

  attr_accessible :description, :goal, :teaser, :title

  validates :title, presence: true, length: {maximum: 100}
  validates :teaser, presence: true, length: {maximum: 255}
  validates :description, presence: true
  validates :goal, presence: true, numericality: {greater_than: 0, allow_blank: true}

  scope :latest, order('created_at DESC')
end
