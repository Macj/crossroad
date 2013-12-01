require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'get right info' do
    address = Address.new(:building => '50а', :city => 'Днепропетровск', :street => 'Совхозная')
    params = {:lat=>48.531418, :lng=>35.07339899999999, :content=>"Украина, г.Днепропетровск, Совхозная, 50а"}
    assert_equal(params, address.get_info, "have a problem with google")
  end

  test 'get right full info' do
    address = Address.new(:building => '50а', :city => 'Днепропетровск', :street => 'Совхозная')
    assert_equal("Украина, г.Днепропетровск, Совхозная, 50а", address.full)
  end
end
