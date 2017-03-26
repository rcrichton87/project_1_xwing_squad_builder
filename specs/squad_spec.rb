require('minitest/autorun')
require('minitest/rg')
require_relative('../models/squad.rb')

class TestSquad < MiniTest::Test
  
  def setup
    @squad = Squad.new({'name' => 'Rogue Squadron', 'faction' => 'rebel', 'id' => '10'})
  end

  def test_id
    expected = 10
    actual = @squad.id
    assert_equal(expected, actual)
  end

  def test_name
    expected = 'Rogue Squadron'
    actual = @squad.name
    assert_equal(expected, actual)
  end

  def test_set_name
    expected = 'Red Squadron'
    @squad.name = 'Red Squadron'
    assert_equal(expected, @squad.name)
  end

  def test_faction
    expected = 'rebel'
    actual = @squad.faction
    assert_equal(expected, actual)
  end

  def test_set_faction
    expected = 'scum'
    @squad.faction = 'scum'
    assert_equal(expected, @squad.faction)
  end

end