require 'dry/transaction'

module Users
  class CreateTransaction
    include Dry::Transaction

    step :create
    step :send_welcome_email

    private

    def create(params)
      user = User.new(params)
      if user.save
        Success(user)
      else
        Failure(user.errors.full_messages)
      end
    end

    def send_welcome_email(user)
        UserMailer.welcome_email(user).deliver_now
        Success(user)
    end
  end
end