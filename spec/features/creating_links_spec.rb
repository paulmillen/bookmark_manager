feature 'Creating links' do

  scenario 'when adding a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    click_button 'Create link'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
    end
  end
end
