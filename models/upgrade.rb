require_relative('../db/sql_runner.rb')

class Upgrade

  attr_reader :id
  attr_accessor :name, :type, :cost, :effect

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @cost = options['cost'].to_i
    @effect = options['effect'] 
  end

  def save
    sql = "INSERT INTO upgrades (name, type, cost, effect) VALUES ('#{@name}', '#{@type}', #{@cost}, '#{@effect}') RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM upgrades;"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM upgrades WHERE id = #{id};"
    upgrade = SqlRunner.run(sql).first
    return Upgrade.new(upgrade)
  end

  def self.get_many(sql)
    upgrades = SqlRunner.run(sql)
    result = upgrades.map { |upgrade| Upgrade.new(upgrade) }
    return result
  end

  def self.all
    sql = "SELECT * FROM upgrades;"
    return self.get_many(sql)
  end

  def delete
    sql = "DELETE FROM upgrades WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE upgrades SET (name, type, cost, effect) = ('#{@name}', '#{@type}', #{@cost}, '#{@effect}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all_types
    all_upgrades = self.all
    upgrade_types = []
    all_upgrades.each do |upgrade|
      upgrade_types.push(upgrade.type)
    end
    upgrade_types.uniq!
    return upgrade_types
  end

end