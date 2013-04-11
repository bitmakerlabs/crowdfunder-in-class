class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges

  attr_accessible :description, :goal, :teaser, :title
end
