require_relative('../db/sql_runner.rb')
require_relative('./pilot.rb')
require_relative('./upgrade.rb')
require_relative('./piloted_ships_upgrades.rb')

class Ship

  attr_reader :id
  attr_accessor :name, :stats, :upgrades, :manoeuvres, :faction, :cost

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @stats = options['stats'].split(", ").map { |s| s.to_i }
    @upgrades = options['upgrades'].split(', ')
    @manoeuvres = options['manoeuvres']
    @faction = options['faction']
    @cost = options['cost'].to_i
  end

  def stats_string
    stats_as_string = @stats.join(", ")
    stats = stats_as_string
    return stats
  end

  def upgrades_string
    upgrades_as_string = @upgrades.join(", ")
    upgrades = upgrades_as_string
    return upgrades
  end

  def save
    sql = "INSERT INTO ships (name, stats, upgrades, manoeuvres, faction, cost) VALUES ('#{@name}', '#{stats_string}', '#{upgrades_string}', '#{@manoeuvres}', '#{@faction}', #{@cost}) RETURNING *;"
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

  def update
    sql = "UPDATE ships SET (name, stats, upgrades, manoeuvres, faction, cost) = ('#{@name}', '#{@stats}', '#{upgrades_string}', '#{@manoeuvres}', '#{@faction}', #{@cost}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def default_upgrades
    sql = "SELECT * FROM upgrades WHERE effect = 'No effect';"
    upgrades = Upgrade.get_many(sql)
    default_upgrades = []
    available_upgrades = @upgrades.join(", ")
    upgrades.each do |upgrade|
      if available_upgrades.include?(upgrade.type) == true
        default_upgrades.push("#{upgrade.type} => #{upgrade.id}")
      end
    end
    upgrades_string = default_upgrades.join(", ")
    upgrades_object = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => upgrades_string})
    upgrades_object.save
    return upgrades_object
  end

end