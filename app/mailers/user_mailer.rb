class UserMailer < ApplicationMailer
  default from: 'mandrill@mandrill.com'

  def post_created(post)
    @post = post
    mail  to: ENV["DEV_EMAIL"],
          subject: "New Post created"
  end

end
