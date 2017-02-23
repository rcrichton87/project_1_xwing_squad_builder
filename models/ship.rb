require_relative('../db/sql_runner.rb')

class Ship

  attr_reader :id
  attr_accessor :name, :stats, :upgrades, :manoeuvres, :faction

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @stats = options['stats'] #array [attack, agility, shield, hull]
    @upgrades = options['upgrades']
    @manoeuvres = options['manoeuvres']
    @faction = options['faction']
  end

  def save
    sql = "INSERT INTO ships (name, stats, upgrades, manoeuvres, faction) VALUES ('#{@name}', '#{@stats}', '#{@upgrades}', '#{@manoeuvres}', '#{@faction}') RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM ships;"
    SqlRunner.run(sql)
  end

end