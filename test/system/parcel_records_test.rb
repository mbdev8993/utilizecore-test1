require "application_system_test_case"

class ParcelRecordsTest < ApplicationSystemTestCase
  setup do
    @parcel_record = parcel_records(:one)
  end

  test "visiting the index" do
    visit parcel_records_url
    assert_selector "h1", text: "Parcel Records"
  end

  test "creating a Parcel record" do
    visit parcel_records_url
    click_on "New Parcel Record"

    fill_in "File", with: @parcel_record.file
    click_on "Create Parcel record"

    assert_text "Parcel record was successfully created"
    click_on "Back"
  end

  test "updating a Parcel record" do
    visit parcel_records_url
    click_on "Edit", match: :first

    fill_in "File", with: @parcel_record.file
    click_on "Update Parcel record"

    assert_text "Parcel record was successfully updated"
    click_on "Back"
  end

  test "destroying a Parcel record" do
    visit parcel_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parcel record was successfully destroyed"
  end
end
