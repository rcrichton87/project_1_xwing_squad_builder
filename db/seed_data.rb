require_relative('../models/pilot.rb')
require_relative('../models/ship.rb')
require('pry')

Pilot.delete_all
Ship.delete_all

ship1 = Ship.new({
  'name' => 'T-65 X-Wing',
  'stats' => '{3, 2, 2, 3}',
  'upgrades' => '{"astromech", "torpedo", "modification"}',
  'manoeuvres' => 'link to manoeuvre image',
  'faction' => 'rebel'
})
ship1.save

pilot1 = Pilot.new({
  'name' => 'Luke Skywalker',
  'pilot_skill' => 8,
  'pilot_ability' => 'When defending, you may change one focus result to an evade result.',
  'cost' => 7,
  'ship_id' => ship1.id
})
pilot1.save

pilot2 = Pilot.new({
  'name' => 'Wedge Antilles',
  'pilot_skill' => 9,
  'pilot_ability' => 'When attacking, reduce the defenders agility by 1.',
  'cost' => 8,
  'ship_id' => ship1.id
})
pilot2.save

pilot3 = Pilot.new({
  'name' => 'Rookie Pilot',
  'pilot_skill' => 2,
  'pilot_ability' => 'None.',
  'cost' => 0,
  'ship_id' => ship1.id
})
pilot3.save


binding.pry
nil