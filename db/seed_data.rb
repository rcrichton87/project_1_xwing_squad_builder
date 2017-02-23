require_relative('../models/pilot.rb')
require('pry')

Pilot.delete_all

pilot1 = Pilot.new({
  'name' => 'Luke Skywalker',
  'pilot_skill' => 8,
  'pilot_ability' => 'When defending, you may change one focus result to an evade result.',
  'cost' => 7,
  'ship_type' => 'xwing'
})

pilot1.save

binding.pry
nil