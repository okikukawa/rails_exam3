class RecordMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    mail to: "shirokumaseason@yahoo.co.jp", subject: "新規投稿しました"
  end
end
