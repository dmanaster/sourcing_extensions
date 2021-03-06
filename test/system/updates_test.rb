require "application_system_test_case"

class UpdatesTest < ApplicationSystemTestCase
  setup do
    @update = updates(:one)
  end

  test "visiting the index" do
    visit updates_url
    assert_selector "h1", text: "Updates"
  end

  test "creating a Update" do
    visit updates_url
    click_on "New Update"

    fill_in "Date", with: @update.date
    fill_in "Extension", with: @update.extension_id
    fill_in "Overview", with: @update.overview
    fill_in "Version", with: @update.version
    click_on "Create Update"

    assert_text "Update was successfully created"
    click_on "Back"
  end

  test "updating a Update" do
    visit updates_url
    click_on "Edit", match: :first

    fill_in "Date", with: @update.date
    fill_in "Extension", with: @update.extension_id
    fill_in "Overview", with: @update.overview
    fill_in "Version", with: @update.version
    click_on "Update Update"

    assert_text "Update was successfully updated"
    click_on "Back"
  end

  test "destroying a Update" do
    visit updates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Update was successfully destroyed"
  end
end
