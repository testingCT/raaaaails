require 'rails_helper'

RSpec.describe Users::CreateTransaction, type: :transaction do
  let(:params) { FactoryBot.attributes_for(:user) }

  it 'creates a new user' do
    transaction = described_class.new
    result = transaction.call(params)
    expect(result).to be_success
  end

  it 'sends a welcome email to the new user' do
    transaction = described_class.new
    expect(UserMailer).to receive(:welcome_email).and_call_original
    transaction.call(params)
  end

  it 'returns a User object' do
    transaction = described_class.new
    result = transaction.call(params)
    expect(result.value!).to be_a(User)
  end

  it 'persists the new user' do
    transaction = described_class.new
    result = transaction.call(params)
    expect(result.value!).to be_persisted
  end
end