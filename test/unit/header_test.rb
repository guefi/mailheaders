require 'test_helper'

class HeaderTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Header.new.valid?
  end
end
