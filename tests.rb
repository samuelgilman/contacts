require 'test/unit'
require_relative 'manager'

class ManagerTest < Test::Unit::TestCase

  def setup
    file = File.readlines(File.expand_path('contacts.csv', __dir__));
    @manager = Manager.new(file)
  end

  def test_find_by_last_name_with_result
    assert_equal(@manager.find_by_last_name('McCrea').length, 1)
  end

  def test_find_by_last_name_with_results
    assert_equal(@manager.find_by_last_name('S').length, 3)
  end

  def test_find_by_last_name_sorted
    contacts = @manager.find_by_last_name('S')
    assert_equal(
      contacts.first,
      'Last: Sauceda, First: Larry, Phone: 3076999741, E-mail: LarryESauceda@armyspy.com'
    )
    assert_equal(
      contacts.last,
      'Last: Shryock, First: William, Phone: 7704585414, E-mail: WilliamLShryock@rhyta.com'
    )
  end

  def test_find_by_email_with_result
    assert_equal(@manager.find_by_email('Amy').length, 1)
  end

  def test_find_by_email_with_results
    assert_equal(@manager.find_by_email('L').length, 2)
  end

  def test_find_by_email_sorted
    contacts = @manager.find_by_email('W')
    assert_equal(
      contacts.first,
      'Last: Jackson, First: Willard, Phone: 7704585414, E-mail: WillardJackson@yahoo.com'
    )
    assert_equal(
      contacts.last,
      'Last: Shryock, First: William, Phone: 7704585414, E-mail: WilliamLShryock@rhyta.com'
    )
  end

end
