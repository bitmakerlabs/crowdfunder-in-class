class UserMailer < ActionMailer::Base
  default from: "no-reply@crowdfunder.com"

  def new_pledge(pledge)
    @owner   = pledge.project.user
    @project = pledge.project
    @pledge  = pledge
    @backer  = pledge.user

    mail(:to => @owner.email, :subject => "New Pledge for your project")
  end

  # UserMailer.forgot_password(@user).deliver
  # def forgot_password(user)

  # end
end
