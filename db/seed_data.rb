require_relative('../models/pilot.rb')
require_relative('../models/ship.rb')
require_relative('../models/piloted_ship.rb')
require_relative('../models/squad.rb')
require_relative('../models/upgrade.rb')
require_relative('../models/piloted_ships_upgrades.rb')
require('pry')

PilotedShip.delete_all
Upgrade.delete_all
Pilot.delete_all
Ship.delete_all
Squad.delete_all
PilotedShipsUpgrades.delete_all

squad1 = Squad.new({'name' => 'Battle of Yavin', 'faction' => 'rebel'})
squad1.save

squad2 = Squad.new({'name' => 'Black Squadron', 'faction' => 'imperial'})
squad2.save

ship1 = Ship.new({
  'name' => 'T-65 X-Wing',
  'stats' => '3, 2, 2, 3',
  'upgrades' => 'astromech, torpedo, modification',
  'manoeuvres' => '/images/x_wing_manoeuvres.png',
  'cost' => 21,
  'faction' => 'rebel'
})
ship1.save

ship2 = Ship.new({
  'name' => 'TIE Fighter',
  'stats' => '2, 3, 0, 3',
  'upgrades' => 'modification',
  'manoeuvres' => '/images/tie_fighter_manoeuvres.png',
  'cost' => 12,
  'faction' => 'imperial'
})
ship2.save

ship3 = Ship.new({
  'name' => 'Y-Wing',
  'stats' => '2, 1, 3, 5',
  'upgrades' => 'modification, torpedo1, torpedo2, turret, astromech',
  'manoeuvres' => '/images/y_wing_manoeuvres.png',
  'cost' => 18,
  'faction' => 'rebel'
})
ship3.save

ship4 = Ship.new({
  'name' => 'TIE Advanced',
  'stats' => '2, 3, 2, 3',
  'upgrades' => 'modification, missile',
  'manoeuvres' => '/images/tie_advanced_manoeuvres.png',
  'cost' => 21,
  'faction' => 'imperial'
})
ship4.save

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

pilot4 = Pilot.new({
  'name' => 'Black Squadron Pilot',
  'pilot_skill' => 4,
  'pilot_ability' => 'None.',
  'cost' => 2,
  'ship_id' => ship2.id
})
pilot4.save

pilot5 = Pilot.new({
  'name' => 'Howlrunner',
  'pilot_skill' => 8,
  'pilot_ability' => 'When attacking, friendly ships at range 1 may reroll one attack dice.',
  'cost' => 6,
  'ship_id' => ship2.id
})
pilot5.save

pilot6 = Pilot.new({
  'name' => 'Gold Squadron Pilot',
  'pilot_skill' => 2,
  'pilot_ability' => 'None.',
  'cost' => 0,
  'ship_id' => ship3.id
})
pilot6.save

pilot7 = Pilot.new({
  'name' => 'Dutch Vander',
  'pilot_skill' => 6,
  'pilot_ability' => 'When acquiring a target lock, choose another friendly ship at range 1-2.  The chosen ship may immediately acquire a target lock.',
  'cost' => 5,
  'ship_id' => ship3.id
})
pilot7.save

pilot8 = Pilot.new({
  'name' => 'Tempest Squadron Pilot',
  'pilot_skill' => 2,
  'pilot_ability' => 'None.',
  'cost' => 0,
  'ship_id' => ship4.id
})
pilot8.save

pilot9 = Pilot.new({
  'name' => 'Darth Vader',
  'pilot_skill' => 9,
  'pilot_ability' => 'During your perform action step, you may perform two actions.',
  'cost' => 8,
  'ship_id' => ship4.id
})
pilot9.save

upgrade1 = Upgrade.new({
  'name' => 'None',
  'type' => 'astromech',
  'cost' => 0,
  'effect' => 'No effect'
})
upgrade1.save

upgrade2 = Upgrade.new({
  'name' => 'None',
  'type' => 'modification',
  'cost' => 0,
  'effect' => 'No effect'
})
upgrade2.save

upgrade3 = Upgrade.new({
  'name' => 'None',
  'type' => 'torpedo',
  'cost' => 0,
  'effect' => 'No effect'
})
upgrade3.save

upgrade4 = Upgrade.new({
  'name' => 'None',
  'type' => 'missile',
  'cost' => 0,
  'effect' => 'No effect'
})
upgrade4.save

upgrade5 = Upgrade.new({
  'name' => 'None',
  'type' => 'turret',
  'cost' => 0,
  'effect' => 'No effect'
})
upgrade5.save

upgrade6 = Upgrade.new({
  'name' => 'R2-D2',
  'type' => 'astromech',
  'cost' => 4,
  'effect' => 'After executing a green maneuver, you may regain one shield, up to you maximum value.'
})
upgrade6.save

piloted_ships_upgrades1 = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => "astromech => #{upgrade6.id}, modification => #{upgrade2.id}, torpedo => #{upgrade3.id}"})
piloted_ships_upgrades1.save

piloted_ships_upgrades2 = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => "astromech => #{upgrade1.id}, modification => #{upgrade2.id}, torpedo => #{upgrade3.id}"})
piloted_ships_upgrades2.save

piloted_ships_upgrades3 = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => "astromech => #{upgrade1.id}, modification => #{upgrade2.id}, torpedo1 => #{upgrade3.id}, torpedo2 => #{upgrade3.id}, turret => #{upgrade5.id}"})
piloted_ships_upgrades3.save

piloted_ships_upgrades4 = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => "astromech => #{upgrade1.id}, modification => #{upgrade2.id}, torpedo1 => #{upgrade3.id}, torpedo2 => #{upgrade3.id}, turret => #{upgrade5.id}"})
piloted_ships_upgrades4.save

piloted_ships_upgrades5 = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => "modification => #{upgrade2.id}, missile => #{upgrade4.id}"})
piloted_ships_upgrades5.save

piloted_ships_upgrades6 = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => "modification => #{upgrade2.id}, missile => #{upgrade4.id}"})
piloted_ships_upgrades6.save

piloted_ships_upgrades7 = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => "modification => #{upgrade2.id}"})
piloted_ships_upgrades7.save

piloted_ships_upgrades8 = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => "modification => #{upgrade2.id}"})
piloted_ships_upgrades8.save

piloted_ships_upgrades9 = PilotedShipsUpgrades.new({'upgrade_hashes_as_string' => "modification => #{upgrade2.id}"})
piloted_ships_upgrades9.save

pilotedship1 = PilotedShip.new({
  'pilot_id' => pilot1.id, 
  'ship_id' => ship1.id, 
  'squad_id' => squad1.id,
  'piloted_ships_upgrades_id' => piloted_ships_upgrades1.id
})
pilotedship1.save

pilotedship2 = PilotedShip.new({
  'pilot_id' => pilot2.id, 
  'ship_id' => ship1.id, 
  'squad_id' => squad1.id,
  'piloted_ships_upgrades_id' => piloted_ships_upgrades2.id
})

pilotedship2.save

pilotedship3 = PilotedShip.new({
  'pilot_id' => pilot6.id, 
  'ship_id' => ship3.id, 
  'squad_id' => squad1.id,
  'piloted_ships_upgrades_id' => piloted_ships_upgrades3.id
})
pilotedship3.save

pilotedship4 = PilotedShip.new({
  'pilot_id' => pilot7.id, 
  'ship_id' => ship3.id, 
  'squad_id' => squad1.id,
  'piloted_ships_upgrades_id' => piloted_ships_upgrades4.id
})
pilotedship4.save

pilotedship5 = PilotedShip.new({
  'pilot_id' => pilot9.id, 
  'ship_id' => ship4.id, 
  'squad_id' => squad2.id,
  'piloted_ships_upgrades_id' => piloted_ships_upgrades5.id
})
pilotedship5.save

pilotedship6 = PilotedShip.new({
  'pilot_id' => pilot8.id, 
  'ship_id' => ship4.id, 
  'squad_id' => squad2.id,
  'piloted_ships_upgrades_id' => piloted_ships_upgrades6.id
})
pilotedship6.save

pilotedship7 = PilotedShip.new({
  'pilot_id' => pilot5.id, 
  'ship_id' => ship2.id, 
  'squad_id' => squad2.id,
  'piloted_ships_upgrades_id' => piloted_ships_upgrades7.id
})
pilotedship7.save

pilotedship8 = PilotedShip.new({
  'pilot_id' => pilot4.id, 
  'ship_id' => ship2.id, 
  'squad_id' => squad2.id,
  'piloted_ships_upgrades_id' => piloted_ships_upgrades8.id
})
pilotedship8.save

pilotedship9 = PilotedShip.new({
  'pilot_id' => pilot4.id, 
  'ship_id' => ship2.id, 
  'squad_id' => squad2.id,
  'piloted_ships_upgrades_id' => piloted_ships_upgrades9.id
})
pilotedship9.save

test = PilotedShip.find(pilotedship1.id)

binding.pry
nil