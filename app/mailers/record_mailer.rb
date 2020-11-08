class RecordMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    mail to: "shirokumaseason@yahoo.co.jp", subject: "お問い合わせの確認メール"
  end
end
