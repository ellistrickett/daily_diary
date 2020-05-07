feature 'Viewing entries' do
  scenario 'visits index page' do
    visit('/')
    expect(page).to have_content 'All Entries:'
  end

  scenario "Shows array of entries" do
    connection = PG.connect(dbname: 'daily_diary_test')

    connection.exec("INSERT INTO entries(title) VALUES('07/05/2020');")
    connection.exec("INSERT INTO entries(title) VALUES('08/05/2020');")
    connection.exec("INSERT INTO entries(title) VALUES('09/05/2020');")

    visit('/')
    expect(page).to have_content '07/05/2020'
    expect(page).to have_content '08/05/2020'
    expect(page).to have_content '09/05/2020'
  end
end