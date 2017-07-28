require_relative '../sign_helper'

feature 'User sign out' do

  include SessionHelper

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
    end

    scenario 'user can sign out' do
      sign_in(email: user.email, password: user.password)
      sign_out
      expect(current_path).to eq '/links'
      expect(page).to have_content 'goodbye!'
      expect(page).not_to have_content 'Welcome'
    end

end
