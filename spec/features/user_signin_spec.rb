require_relative '../sign_helper'

feature 'User sign in' do

  include SessionHelper

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
    end

    scenario 'with correct credentials' do
      sign_in(email: user.email, password: user.password)
      expect(page).to have_content "Welcome, #{user.email}"
    end

    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
    end

end