class Pledge < ActiveRecord::Base
  attr_accessible :amount
                        # , :project_id, :user_id -- should not be modifiable through mass assignment

  belongs_to :user
  belongs_to :project

  validates :user,    :presence => true
  validates :project, :presence => true

  validates :amount,  :numericality => {:only_integer => true, :greater_than => 0}, :presence => true
end
