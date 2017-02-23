require_relative('../db/sql_runner.rb')

class Ship

  attr_reader :id
  attr_accessor :name, :stats, :upgrades, :manoeuvres, :faction

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @stats = options['stats']
    @upgrades = options['upgrades']
    @manoeuvres = options['manoeuvres']
    @faction = options['faction']
  end

end