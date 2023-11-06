require_relative '../rails_helper'

RSpec.describe User, type: :model do
    context 'validation tests' do
        let(:user) { build(:user) }
        it 'ensures first_name is present' do
            user = User.new(first_name: nil)
            expect(user).to_not be_valid
        end
        it 'ensures last_name is present' do
            user = User.new(last_name: nil)
            expect(user).to_not be_valid
        end
        it 'ensures date_of_birth is present' do
            user = User.new(date_of_birth: nil)
            expect(user).to_not be_valid
        end
        it 'ensures email is present' do
            user = User.new(email: nil)
            expect(user).to_not be_valid
        end
        it 'ensures password is present' do
            user = User.new(password: nil)
            expect(user).to_not be_valid
        end
        it 'ensures password confirmation is present' do
            user = User.new(password_confirmation: nil)
            expect(user).to_not be_valid
        end 
    end
end
