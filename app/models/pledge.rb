class Pledge < ActiveRecord::Base
  attr_accessible :amount
                        # , :project_id, :user_id -- should not be modifiable through mass assignment

  belongs_to :user
  belongs_to :project

  # after_create :send_new_pledge_email

  validates :user,    :presence => true
  validates :project, :presence => true

  validates :amount,  :numericality => {:only_integer => true, :greater_than => 0}, :presence => true

  # def send_new_pledge_email
  #   UserMailer.new_pledge(self).deliver
  # end
end
