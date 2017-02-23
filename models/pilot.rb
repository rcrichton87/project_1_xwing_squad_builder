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
    @ship_type = options['ship_type']
  end

  def save
    sql = "INSERT INTO pilots (name, pilot_skill, pilot_ability, cost, ship_type) VALUES ('#{@name}', #{@pilot_skill}, '#{@pilot_ability}', #{@cost}, '#{@ship_type}') RETURNING *;"
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
end