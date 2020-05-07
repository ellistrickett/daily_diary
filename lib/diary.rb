require 'pg'

class Diary

  attr_reader :title

  def initialize(title)
    @title = title
  end

  def self.all

    entries = []

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'daily_diary_test'
    else
      con = PG.connect :dbname => 'daily_diary'
    end

    result = con.exec('SELECT * FROM entries;')
    result.each do |row|
      entries << Diary.new(row['title'])
    end

    entries
  end

end