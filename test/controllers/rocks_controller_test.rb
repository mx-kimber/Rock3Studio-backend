require "test_helper"

class RocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rock = rocks(:one)
  end

  test "should get index" do
    get rocks_url
    assert_response :success
  end

  test "should get new" do
    get new_rock_url
    assert_response :success
  end

  test "should create rock" do
    assert_difference("Rock.count") do
      post rocks_url, params: { rock: { category: @rock.category, color: @rock.color, condition: @rock.condition, date_acquired: @rock.date_acquired, dimensions: @rock.dimensions, hardness: @rock.hardness, location: @rock.location, notes: @rock.notes, price: @rock.price, rock_name: @rock.rock_name, source: @rock.source, type: @rock.type, weight: @rock.weight } }
    end

    assert_redirected_to rock_url(Rock.last)
  end

  test "should show rock" do
    get rock_url(@rock)
    assert_response :success
  end

  test "should get edit" do
    get edit_rock_url(@rock)
    assert_response :success
  end

  test "should update rock" do
    patch rock_url(@rock), params: { rock: { category: @rock.category, color: @rock.color, condition: @rock.condition, date_acquired: @rock.date_acquired, dimensions: @rock.dimensions, hardness: @rock.hardness, location: @rock.location, notes: @rock.notes, price: @rock.price, rock_name: @rock.rock_name, source: @rock.source, type: @rock.type, weight: @rock.weight } }
    assert_redirected_to rock_url(@rock)
  end

  test "should destroy rock" do
    assert_difference("Rock.count", -1) do
      delete rock_url(@rock)
    end

    assert_redirected_to rocks_url
  end
end
