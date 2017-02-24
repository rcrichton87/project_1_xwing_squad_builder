require_relative('../db/sql_runner.rb')

class Pilot

  attr_reader :id, :ship_id
  attr_accessor :name, :pilot_skill, :pilot_ability, :cost

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @pilot_skill = options['pilot_skill'].to_i
    @pilot_ability = options['pilot_ability']
    @cost = options['cost'].to_i
    @ship_id = options['ship_id']
  end

  def save
    sql = "INSERT INTO pilots (name, pilot_skill, pilot_ability, cost, ship_id) VALUES ('#{@name}', #{@pilot_skill}, '#{@pilot_ability}', #{@cost}, '#{@ship_id}') RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM pilots;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM pilots WHERE id=#{@id};"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE pilots SET (name, pilot_skill, pilot_ability, cost, ship_type) = ('#{@name}', #{@pilot_skill}, '#{@pilot_ability}', #{@cost}, '#{@ship_type}') WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end

  def self.find(id)
    sql = "SELECT * FROM pilots WHERE id = #{id};"
    pilot = SqlRunner.run(sql).first
    return Pilot.new(pilot)
  end

  def self.all
    sql = "SELECT * FROM pilots;"
    return self.get_many(sql)
  end

  def self.get_many(sql)
    pilots = SqlRunner.run(sql)
    result = pilots.map { |pilot| Pilot.new(pilot) }
    return result
  end

  def ship
    sql = "SELECT * FROM ships WHERE id = #{@ship_id};"
    ship = SqlRunner.run(sql).first
    return Ship.new(ship)
  end
  
end