require_relative('../db/sql_runner.rb')

class Ship

  attr_reader :id
  attr_accessor :name, :stats, :upgrades, :manoeuvres, :faction, :cost

  def initialize(options)
    @id = options['id']
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

end