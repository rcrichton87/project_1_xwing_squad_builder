require_relative('../db/sql_runner.rb')
require_relative('./piloted_ship.rb')

class Squad

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO squads (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM squads;"
    SqlRunner.run(sql)
  end

  def piloted_ships
    sql = "SELECT * FROM piloted_ships WHERE squad_id = #{@id};"
    piloted_ships = SqlRunner.run(sql)
    results = piloted_ships.map{ |piloted_ship| PilotedShip.new(piloted_ship) }
    return results
  end

  def total_cost
    piloted_ships = self.piloted_ships
    total_cost = 0
    piloted_ships.each { |piloted_ship| total_cost += piloted_ship.total_cost}
    return total_cost
  end

  def get_many(sql)
    squads = SqlRunner.run(sql)
    results = squads.map{ |squad| Squad.new(squad)}
  end

end