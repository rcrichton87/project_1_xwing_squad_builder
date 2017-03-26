require('minitest/autorun')
require('minitest/rg')
require_relative('../models/pilot.rb')
require_relative('../models/ship.rb')
require_relative('../models/squad.rb')
require_relative('../models/piloted_ship.rb')
require_relative('../models/upgrade.rb')


class TestPilotedShip < MiniTest::Test

  def setup
    @ship = Ship.new({
      'id' => '1',
      'name' => 'T-65 X-Wing',
      'stats' => '3, 2, 2, 3',
      'upgrades' => 'astromech, torpedo, modification',
      'manoeuvres' => '/images/x_wing_manoeuvres.png',
      'cost' => 21,
      'faction' => 'rebel'
    })
  
    @pilot = Pilot.new({
      'id' => '4',
      'name' => 'Luke Skywalker',
      'pilot_skill' => '8',
      'pilot_ability' => 'When defending, you may change one focus result to an evade result.',
      'cost' => '7',
      'ship_id' => @ship.id
    })

    @squad = Squad.new({
      'name' => 'Rogue Squadron', 
      'faction' => 'rebel', 
      'id' => '10'
    })

    @piloted_ship = PilotedShip.new({
      'id' => '2',
      'pilot_id' => @pilot.id, 
      'ship_id' => @ship.id, 
      'squad_id' => @squad.id,
    })

  end

  def test_id
    expected = 2
    actual = @piloted_ship.id
    assert_equal(expected, actual)
  end

  def test_pilot_id
    expected = 4
    actual = @piloted_ship.pilot_id
    assert_equal(expected, actual)
  end

  def test_ship_id
    expected = 1
    actual = @piloted_ship.ship_id
    assert_equal(expected, actual)
  end

  def test_squad_id
    expected = 10
    actual = @piloted_ship.squad_id
    assert_equal(expected, actual)
  end

end