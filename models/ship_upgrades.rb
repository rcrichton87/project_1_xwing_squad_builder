require_relative('../db/sql_runner.rb')
require_relative('./pilot.rb')
require_relative('./ship.rb')
require_relative('./piloted_ships_upgrades.rb')

class ShipUpgrades

  attr_reader :id, :piloted_ship_id, :upgrade_id

  def initialize(options)
    @id = options['id'].to_i
    @piloted_ship_id = options['piloted_ship_id'].to_i
    @upgrade_id = options['upgrade_id'].to_i
  end

  def save
    sql = "INSERT INTO ship_upgrades (piloted_ship_id, upgrade_id) VALUES (#{@piloted_ship_id}, #{@upgrade_id}) RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def delete
    sql = "DELETE FROM ship_upgrades WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM ship_upgrades;"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE ship_upgrades SET (piloted_ship_id, upgrade_id) = (#{@piloted_ship_id}, #{@upgrade_id}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.default_upgrades(piloted_ship)
    sql1 = "SELECT * FROM upgrades WHERE effect = 'No effect';"
    upgrades = Upgrade.get_many(sql1)
    ship = piloted_ship.ship()
    upgrade_slots = ship.upgrades
    default_upgrades = []
    upgrades.each do |upgrade|
      if upgrade_slots.include?(upgrade.type) == true
        default_upgrades.push(upgrade)
      end
    end
    default_upgrades.each do |upgrade|
      sql2 = "INSERT INTO ship_upgrades (piloted_ship_id, upgrade_id) VALUES (#{piloted_ship.id}, #{upgrade.id});"
      SqlRunner.run(sql2)
    end
  end

  def self.get_many(sql)
    ship_upgrades = SqlRunner.run(sql)
    result = ship_upgrades.map { |ship_upgrade| ShipUpgrades.new(ship_upgrade) }
    return result
  end

  def upgrade()
    sql = "SELECT * FROM upgrades WHERE id = #{@upgrade_id};"
    upgrade = SqlRunner.run(sql).first
    return Upgrade.new(upgrade)
  end

end