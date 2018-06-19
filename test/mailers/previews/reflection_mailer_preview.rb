# Preview all emails at http://localhost:3000/rails/mailers/reflection_mailer
class ReflectionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reflection_mailer/weekly_reflection
  def weekly_reflection
    ReflectionMailer.weekly_reflection
  end

end
