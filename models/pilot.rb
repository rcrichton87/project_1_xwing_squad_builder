class Pilot

  attr_reader :id, :ship_id
  attr_accessor :name, :pilot_skill, :pilot_ability, :cost

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @pilot_skill = options['pilot_skill'].to_i
    @pilot_ability = options['pilot_ability']
    @cost = options['cost']
    @ship_id = options['ship_id']
  end

end