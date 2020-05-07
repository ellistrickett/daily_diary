feature 'Homepage' do 
  scenario 'is live' do 
    visit '/'
    expect(page).to have_content 'Hello, World!'
  end
end
