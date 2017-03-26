require_relative('../db/sql_runner.rb')
require_relative('./pilot.rb')
require_relative('./ship.rb')
require_relative('./piloted_ships_upgrades.rb')

class PilotedShip

  attr_reader :id, :pilot_id, :ship_id

  def initialize(options)
    @id = options['id'].to_i
    @pilot_id = options['pilot_id'].to_i
    @ship_id = options['ship_id'].to_i
    @squad_id = options['squad_id'].to_i 
  end

  def upgrades
    sql = "SELECT upgrades.* FROM
    upgrades INNER JOIN ship_upgrades ON upgrade_id = upgrades.id
    WHERE piloted_ship_id = #{@id};"
    upgrades = Upgrade.get_many(sql)
    return upgrades
  end

  def save
    sql = "INSERT INTO piloted_ships (pilot_id, ship_id, squad_id) VALUES (#{@pilot_id}, #{@ship_id}, #{@squad_id}) RETURNING *;"
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
    self.upgrades.each do |upgrade|
       total_cost += upgrade.cost
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
    sql = "UPDATE piloted_ships SET (pilot_id, ship_id, squad_id) = (#{@pilot_id}, #{@ship_id}, #{@squad_id}) where id = #{@id};"
    SqlRunner.run(sql)
  end

  def ship_upgrades()
    sql = "SELECT * FROM ship_upgrades WHERE piloted_ship_id = #{@id};"
    ship_upgrades = ShipUpgrades.get_many(sql)
    return ship_upgrades
  end

  def has_upgrade(upgrade)
    equipped_upgrades = self.ship_upgrades
    equipped_upgrades.each do |equipped_upgrade|
      if equipped_upgrade.upgrade_id == upgrade.id
        return true
      end
    end
    return false
  end

end