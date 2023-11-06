
class Users::RegistrationsController < Devise::RegistrationsController
  def new 
    super
  end
  def create
    result = Users::CreateTransaction.new.call(sign_up_params)
    if result.success?
      redirect_to root_path, notice: 'User created successfully'
    else
      # Handle failure case
      flash.now[:alert] = result.failure
      render :new
    end
  end
  def update 
    super 
  end 
end
