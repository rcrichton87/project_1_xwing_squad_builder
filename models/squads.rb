require_relative('../db/sql_runner.rb')

class Squad

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO squads (name) VALUES ('#{@name}) RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

end