class ReflectionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reflection_mailer.weekly_reflection.subject
  #
  default from: "postmaster@sandbox79904ddb5152410890e7f7a9da0bb03c.mailgun.org"
  
  
  def weekly_reflection(user)
    @user = User.find(5)
    date_to = DateTime.now
    if @user.last_reflection_on == nil
    date_from = @user.created_at.to_date
    else
    date_from = @user.last_reflection_on
    end
    @user_responses = Response.where(:user_id => @user.id, :created_at => date_from.beginning_of_day..date_to.end_of_day).all.order(created_at: :desc)
    mail(to: @user.email, subject: 'Your weekly summary from WDYLT')
  end
end
