require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe '#Create' do
    context 'with valid params' do
      let(:valid_params) do
        FactoryBot.attributes_for(:user)
      end
      it 'creates a new user' do
        expect do
          post :create, params: { user: valid_params }
        end.to change(User, :count).by(1)
      end
      it 'redirects to the root path' do
        post :create, params: { user: valid_params }
        expect(response).to redirect_to(root_path)
      end

      it 'sets a success notice' do
        post :create, params: { user: valid_params }
        expect(flash[:notice]).to eq('User created successfully')
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        { user: { first_name: '', last_name: '', date_of_birth: '', email: '', password: '', password_confirmation: '' } }
      end

      it 'does not create a new user' do
        expect do
          post :create, params: invalid_params
        end.not_to change(User, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end

    end
  end
end
