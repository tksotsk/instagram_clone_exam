class UserMailer < ApplicationMailer
  def user_mail(user,picture)
    @user = user
    @picture = picture
    mail to: @user.email, subject: "画像投稿の確認メール"
  end
end
