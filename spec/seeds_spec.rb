# spec/seeds_spec.rb
# spec/seeds_spec.rb

require 'rails_helper'

RSpec.describe 'Seed Data' do
  context 'when the seed file is executed' do
    before do
        load Rails.root.join('db', 'seeds.rb')
    end

    it 'creates the expected records' do
        expect(User.count).to eq(2)
    end
    it 'creates an admin user' do
        expect(User.find_by(admin: true)).to be_present 
    end 
    it 'creates a non-admin user' do
        expect(User.find_by(admin: false)).to be_present
    end
    
  end
end
