# view at http://localhost:3000/rails/mailers/devise_mailer

class DeviseMailerPreview < ActionMailer::Preview
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(User.first, "faketoken")
  end

  def reset_password_instructions
    Devise::Mailer.reset_password_instructions(User.first, "faketoken")
  end

  def email_changed
    Devise::Mailer.email_changed(User.first)
  end

  def password_changed
    Devise::Mailer.password_change(User.first)
  end
end
