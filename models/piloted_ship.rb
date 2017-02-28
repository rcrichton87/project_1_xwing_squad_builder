require_relative('../db/sql_runner.rb')
require_relative('./pilot.rb')
require_relative('./ship.rb')
require_relative('./piloted_ships_upgrades.rb')

class PilotedShip

  attr_reader :id, :pilot_id, :ship_id
  attr_accessor :upgrades

  def initialize(options)
    @id = options['id'].to_i
    @pilot_id = options['pilot_id'].to_i
    @ship_id = options['ship_id'].to_i
    @squad_id = options['squad_id'].to_i 
    @piloted_ships_upgrades_id = options['piloted_ships_upgrades_id'].to_i
  end

  def upgrades_hashes(string) # converts a string to hashes
    array_of_strings = string.split(", ") #split string into array of strings 'upgrade => id' around commas
    upgrades = Array.new #new empty array
    array_of_strings.map do |hash_string|
      key_value_array = hash_string.split(" => ") #split the string around ' => ', giving an array of [key, value]
      upgradehash = {key_value_array.first.to_s => key_value_array.last.to_i} #use these to make a hash
      upgrades.push(upgradehash) #push the hash to the upgrades array
    end
    return upgrades # return array of upgrade hashes
  end

  def upgrades_string
    string_array = Array.new #create a new array
    @upgrades.each do |upgrade| #each hash in the upgrades array
      upgrade.each_pair do |key, value| # take the key, value pair
        upgrade_as_string = [key, value].join(" => ") #make them into a string 'key => value'
        string_array.push(upgrade_as_string) #add them to an array of strings
      end
    end
    return string_array.join(", ") #join the array into one long string
  end

  def upgrades
    sql = "SELECT * FROM piloted_ships_upgrades WHERE id = #{@piloted_ships_upgrades_id};"
    result = SqlRunner.run(sql).first
    piloted_ships_upgrades = PilotedShipsUpgrades.new(result)
    array_of_strings = piloted_ships_upgrades.upgrade_hashes_as_string.split(", ") #split string into array of strings 'upgrade => id' around commas
    upgrades = Array.new #new empty array
    array_of_strings.map do |hash_string|
      key_value_array = hash_string.split(" => ") #split the string around ' => ', giving an array of [key, value]
      upgradehash = {key_value_array.first.to_s => key_value_array.last.to_i} #use these to make a hash
      upgrades.push(upgradehash) #push the hash to the upgrades array
    end
    return upgrades # return array of upgrade hashes
  end

  def save
    sql = "INSERT INTO piloted_ships (pilot_id, ship_id, squad_id, piloted_ships_upgrades_id) VALUES (#{@pilot_id}, #{@ship_id}, #{@squad_id}, #{@piloted_ships_upgrades_id}) RETURNING *;"
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

  def pilot
    sql = "SELECT * FROM pilots WHERE id = #{@pilot_id};"
    pilot = SqlRunner.run(sql).first
    return Pilot.new(pilot)
  end

  def total_cost
    ship = self.ship
    pilot = self.pilot
    total_cost = 0
    total_cost += ship.cost 
    total_cost += pilot.cost
    self.upgrades.each do |upgrade_hash|
      upgrade_hash.each_pair do |upgrade_type, upgrade_id|
        upgrade = Upgrade.find(upgrade_id)
        total_cost += upgrade.cost
      end
    end
    return total_cost
  end

  def self.find(id)
    sql = "SELECT * FROM piloted_ships WHERE id = #{id};"
    piloted_ship = SqlRunner.run(sql).first
    return PilotedShip.new(piloted_ship)
  end

  def delete
    sql = "DELETE FROM piloted_ships WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE piloted_ships SET (pilot_id, ship_id, squad_id, piloted_ships_upgrades_id) = (#{@pilot_id}, #{@ship_id}, #{@squad_id}, '#{piloted_ships_upgrades_id}') where id = #{@id};"
    SqlRunner.run(sql)
  end

end