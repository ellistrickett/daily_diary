require 'pg'

class Entry

  attr_reader :id, :title, :tags, :comments

  def initialize(id, title, tags, comments)
    @id = id
    @title = title
    @tags = tags
    @comments = comments
  end

  def self.all

    entries = []

    table = connect_to_database.exec('SELECT * FROM entries;')
    table.each do |row|
      entries << Entry.new(row['id'], row['title'], row['tags'], row['comments'])
    end

    entries
  end

  def self.add(title)
    connect_to_database.exec("INSERT INTO entries(title) VALUES ('#{title}')")
  end

  def self.find(find_id)

    found_entry = connect_to_database.exec("SELECT * FROM entries WHERE id = #{find_id};")
    Entry.new(found_entry[0]['id'], found_entry[0]['title'], found_entry[0]['tags'], found_entry[0]['comments'])
  end

  private 

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'daily_diary_test')
    else
      PG.connect(dbname: 'daily_diary')
    end
  end

end