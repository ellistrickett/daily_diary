feature 'Entry Page' do 
  scenario '07/05/2020' do 
    visit '/'

    fill_in('title', with: '07/05/2020')
    click_button('submit')

    click_link('07/05/2020')

    expect(page).to have_content 'This your diary entry for: 07/05/2020'
  end
end

