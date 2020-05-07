feature 'Interactive Entry' do 
  scenario 'takes you to the entry' do 
    visit '/'

    fill_in('title', with: '07/05/2020')
    click_button('submit')

    expect(page).to have_link '07/05/2020'
  end
end