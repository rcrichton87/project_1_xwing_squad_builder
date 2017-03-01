require_relative('../db/sql_runner.rb')

class PilotedShipsUpgrades

  attr_reader :id
  attr_accessor :upgrade_hashes_as_string

  def initialize(options)
    @id = options['id'].to_i
    @upgrade_hashes_as_string = options['upgrade_hashes_as_string']
  end

  def save
    sql = "INSERT INTO piloted_ships_upgrades (upgrade_hashes_as_string) VALUES ('#{@upgrade_hashes_as_string}') RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM piloted_ships_upgrades;"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE piloted_ships_upgrades SET (upgrade_hashes_as_string) = ('#{@upgrade_hashes_as_string}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM piloted_ships_upgrades WHERE id = #{id};"
    piloted_ships_upgrades = SqlRunner.run(sql).first
    return PilotedShipsUpgrades.new(piloted_ships_upgrades)
  end

  def upgrades_hashes(string) # converts a string to hashes
    array_of_strings = string.split(", ") #split string into array of strings 'upgrade => id' around commas
    upgrades = Array.new #new empty array
    upgradehash = Hash.new
    array_of_strings.map do |hash_string|
      key_value_array = hash_string.split(" => ") #split the string around ' => ', giving an array of [key, value]
      upgradehash[key_value_array.first.to_s] = key_value_array.last.to_i #use these to make a hash
      upgrades.push(upgradehash) #push the hash to the upgrades array
    end
    return upgradehash # return array of upgrade hashes
  end

  def upgrades_string(hash)
    string_array = Array.new #create a new array
      hash.each_pair do |key, value| # take the key, value pair
        upgrade_as_string = [key, value].join(" => ") #make them into a string 'key => value'
        string_array.push(upgrade_as_string) #add them to an array of strings
      end
    return string_array.join(", ") #join the array into one long string
  end

  def update_string(upgrade)
    piloted_ships_upgrades_hashes = upgrades_hashes(@upgrade_hashes_as_string)
      piloted_ships_upgrades_hashes[upgrade.type] = upgrade.id
    piloted_ships_upgrades_string = upgrades_string(piloted_ships_upgrades_hashes)
    @upgrade_hashes_as_string = piloted_ships_upgrades_string
  end

end