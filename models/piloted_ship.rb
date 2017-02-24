require_relative('../db/sql_runner.rb')

class PilotedShip

  attr_reader :id, :pilot_id, :ship_id

  def initialize(options)
    @id = options['id'].to_i
    @pilot_id = options['pilot_id'].to_i
    @ship_id = options['ship_id'].to_i 
  end

  def save
    sql = "INSERT INTO piloted_ships (pilot_id, ship_id) VALUES (#{@pilot_id}, #{@ship_id}) RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM piloted_ships;"
    SqlRunner.run(sql)
  end

  def ship
    sql = "SELECT * FROM ships WHERE id = #{@ship_id};"
    ship = SqlRunner.run(sql).first
    return Ship.new(ship)
  end

end