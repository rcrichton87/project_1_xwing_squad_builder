class Upgrade

  attr_reader :id
  attr_accessor :name, :type, :cost, :effect

  def initialize(options)
    id = options['id'].to_i
    name = options['name']
    type = options['type']
    cost = options['cost'].to_i
    effect = options['effect'] 
  end

end