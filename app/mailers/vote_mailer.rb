class VoteMailer < ApplicationMailer
  default from: 'pemilu.himaka@gmail.com'

  def vote_email
    @user = params[:user]
    @post = params[:post]
    mail(to: @user.email, subject: 'Terimakasih Telah Vote!')
  end
end
