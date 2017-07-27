def sign_up(email = 'barney@barney.com')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: 'password1234'
  fill_in :password_confirmation, with: 'password1234'
  click_button 'Register'
end

def password_confirmation_fail
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'barney@barney.com'
  fill_in :password, with: 'password1234'
  fill_in :password_confirmation, with: 'password4321'
  click_button 'Register'
end

def blank_email
  visit '/users/new'
  fill_in :password, with: 'password1234'
  fill_in :password_confirmation, with: 'password1234'
  click_button 'Register'
end

def invalid_email
  visit '/users/new'
  fill_in :email, with: 'hotdog'
  fill_in :password, with: 'password1234'
  fill_in :password_confirmation, with: 'password1234'
  click_button 'Register'
end
