require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'daily_diary_test')

  # Clear the entrie table
  connection.exec("TRUNCATE entries;")
end
