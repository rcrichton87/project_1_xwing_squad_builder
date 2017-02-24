require_relative('../db/sql_runner.rb')

class PilotedShip

  attr_reader :id, :pilot_id, :ship_id

  def initialize(options)
    @id = options['id'].to_i
    @pilot_id = options['pilot_id'].to_i
    @ship_id = options['ship_id'].to_i 
  end

end