require 'rails_helper'

RSpec.describe User do

  describe 'validations' do
    let(:user) { User.create(email: 'example1', password: 'test123', password_confirmation: 'test123') }
    # it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }

    it 'exists' do
      expect(user).to be_a User
    end

    it 'does not store user password or confirmation' do
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('test123')
    end
  end
end
