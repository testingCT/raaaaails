class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def devise_parameter_sanitizer
      if resource_class == User && action_name == 'create'
        CustomUserParameterSanitizer.new(User, :user, params)
      else
        super
      end
    end
  
    def configure_permitted_parameters
      # No need to add anything here
    end
  end

  