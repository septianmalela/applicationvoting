class MyDeviseMailer < Devise::Mailer

  helper :email # gives access to all helpers defined within `email_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def confirmation_instructions(record, token, opts={})
    attachments.inline['instagram.png'] = File.read("app/assets/images/instagram.png")
    attachments.inline['email.png'] = File.read("app/assets/images/email.png")
    attachments.inline['line-brands.png'] = File.read("app/assets/images/line-brands.png")
    attachments.inline['whatsapp-brands.png'] = File.read("app/assets/images/whatsapp-brands.png")
    super
  end

end