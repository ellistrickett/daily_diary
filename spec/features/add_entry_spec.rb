feature 'adding entries' do 
  scenario 'user adds an entry to the diary' do 
    visit '/'

    fill_in('title', with: '07/05/2020')
    click_button('submit')

    expect(page).to have_content 'Title: 07/05/2020'
  end
end