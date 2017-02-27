require_relative('../db/sql_runner.rb')
require_relative('./pilot.rb')

class Ship

  attr_reader :id
  attr_accessor :name, :stats, :upgrades, :manoeuvres, :faction, :cost

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @stats = options['stats'] #array [attack, agility, shield, hull]
    @upgrades = options['upgrades']
    @manoeuvres = options['manoeuvres']
    @faction = options['faction']
    @cost = options['cost'].to_i
  end

  def save
    sql = "INSERT INTO ships (name, stats, upgrades, manoeuvres, faction, cost) VALUES ('#{@name}', '#{@stats}', '#{@upgrades}', '#{@manoeuvres}', '#{@faction}', #{@cost}) RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM ships;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM ships;"
    return self.get_many(sql)
  end

  def self.get_many(sql)
    ships = SqlRunner.run(sql)
    result = ships.map { |ship| Ship.new(ship) }
    return result
  end

  def pilots 
    sql = "SELECT * FROM pilots WHERE ship_id = #{@id};"
    pilots = Pilot.get_many(sql)
    return pilots
  end

  def self.find(id)
    sql = "SELECT * FROM ships WHERE id = #{id}"
    ship = SqlRunner.run(sql).first
    return Ship.new(ship)
  end

  def delete
    sql = "DELETE FROM ships WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

end