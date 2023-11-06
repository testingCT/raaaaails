# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#AdminUser.create!(email: 'administrator@example.com', password: 'password', password_confirmation: 'password')

# Create a User with different states
#User.create(last_name: 'Doe', first_name: 'John', date_of_birth: '1980-01-01' ,email: 'john@example.com', admin: false)
#User.create(last_name: 'Smith', first_name: 'Jane', date_of_birth: '1990-02-01', email: 'jane@example.com', admin: true)

require 'factory_bot'

# Define FactoryBot factories
FactoryBot.define do
  factory :user do
    last_name { 'Doe' } 
    first_name { 'John' }
    date_of_birth { '1980-01-01' }
    email { 'john@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end
end

FactoryBot.create(:user)
FactoryBot.create(last_name: 'Smith', first_name: 'Jane', date_of_birth: '1990-02-01' , email: 'jane@example.com', password: 'password', password_confirmation: 'password', admin: true)
