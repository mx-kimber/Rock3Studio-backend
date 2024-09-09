require "application_system_test_case"

class RocksTest < ApplicationSystemTestCase
  setup do
    @rock = rocks(:one)
  end

  test "visiting the index" do
    visit rocks_url
    assert_selector "h1", text: "Rocks"
  end

  test "should create rock" do
    visit rocks_url
    click_on "New rock"

    fill_in "Category", with: @rock.category
    fill_in "Color", with: @rock.color
    fill_in "Condition", with: @rock.condition
    fill_in "Date acquired", with: @rock.date_acquired
    fill_in "Dimensions", with: @rock.dimensions
    fill_in "Hardness", with: @rock.hardness
    fill_in "Location", with: @rock.location
    fill_in "Notes", with: @rock.notes
    fill_in "Price", with: @rock.price
    fill_in "Rock name", with: @rock.rock_name
    fill_in "Source", with: @rock.source
    fill_in "Type", with: @rock.type
    fill_in "Weight", with: @rock.weight
    click_on "Create Rock"

    assert_text "Rock was successfully created"
    click_on "Back"
  end

  test "should update Rock" do
    visit rock_url(@rock)
    click_on "Edit this rock", match: :first

    fill_in "Category", with: @rock.category
    fill_in "Color", with: @rock.color
    fill_in "Condition", with: @rock.condition
    fill_in "Date acquired", with: @rock.date_acquired
    fill_in "Dimensions", with: @rock.dimensions
    fill_in "Hardness", with: @rock.hardness
    fill_in "Location", with: @rock.location
    fill_in "Notes", with: @rock.notes
    fill_in "Price", with: @rock.price
    fill_in "Rock name", with: @rock.rock_name
    fill_in "Source", with: @rock.source
    fill_in "Type", with: @rock.type
    fill_in "Weight", with: @rock.weight
    click_on "Update Rock"

    assert_text "Rock was successfully updated"
    click_on "Back"
  end

  test "should destroy Rock" do
    visit rock_url(@rock)
    click_on "Destroy this rock", match: :first

    assert_text "Rock was successfully destroyed"
  end
end
