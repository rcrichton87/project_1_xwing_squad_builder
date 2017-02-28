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

  def find(id)
    sql = "SELECT * FROM upgrades WHERE id = #{id};"
    upgrade = SqlRunner.run(sql).first
    return Upgrade.new(upgrade)
  end

end