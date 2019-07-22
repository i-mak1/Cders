class ContactMailer < ApplicationMailer

  def send_when_admin_reply(enduser, contact) #メソッドに対して引数を設定
    @user = enduser #ユーザー情報
    @answer = contact.reply #返信内容
    mail to: enduser.email, subject: '[Cders]お問い合わせありがとうございます'
  end

end
