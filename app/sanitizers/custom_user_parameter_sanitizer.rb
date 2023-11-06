class CustomUserParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:last_name, :first_name, :date_of_birth])
  end
end