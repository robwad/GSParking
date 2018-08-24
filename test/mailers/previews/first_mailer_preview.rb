# Preview all emails at http://localhost:3000/rails/mailers/first_mailer
class FirstMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    FirstMailer.sample_email(Person.find(10))
  end
end
