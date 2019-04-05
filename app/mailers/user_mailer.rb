class UserMailer < ApplicationMailer

    def welcome_email
        @user = params[:user]
        mail(to: @user.email, subjest: 'Welcome to Txttide')
    end
end
