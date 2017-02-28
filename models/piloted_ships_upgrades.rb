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

end