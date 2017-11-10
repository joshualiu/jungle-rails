class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  
   def welcome_email(user)
     @user = user
     mail(to: @user.email, subject: "Your order numer is #{@user.id}")
   end
end
