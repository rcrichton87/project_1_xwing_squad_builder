require('minitest/autorun')
require('minitest/rg')
require_relative('../models/ship.rb')

class TestShip < MiniTest::Test

  def setup
    @ship = Ship.new({
      'id' => '5',
      'name' => 'T-65 X-Wing',
      'stats' => '3, 2, 2, 3',
      'upgrades' => 'astromech, torpedo, modification',
      'manoeuvres' => '/images/x_wing_manoeuvres.png',
      'cost' => '21',
      'faction' => 'rebel'
    })
  end

  def test_id
    assert_equal(5, @ship.id)
  end

  def test_name
    expected = 'T-65 X-Wing'
    actual = @ship.name
    assert_equal(expected, actual)
  end

  def test_set_name
    expected = 'TIE Fighter'
    @ship.name = 'TIE Fighter'
    assert_equal(expected, @ship.name)
  end

  def test_stats
    expected = [3,2,2,3]
    actual = @ship.stats
    assert_equal(expected, actual)
  end

  def test_set_stats
    expected = [3,3,3,3]
    @ship.stats = [3,3,3,3]
    assert_equal(expected, @ship.stats)
  end

  def test_upgrades
    expected = ['astromech', 'torpedo', 'modification']
    actual = @ship.upgrades
    assert_equal(expected, actual)
  end

  def test_set_upgrades
    @ship.upgrades = ['turret']
    expected = ['turret']
    assert_equal(expected, @ship.upgrades)
  end

end