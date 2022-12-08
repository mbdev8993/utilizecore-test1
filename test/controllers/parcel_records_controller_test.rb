require "test_helper"

class ParcelRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parcel_record = parcel_records(:one)
  end

  test "should get index" do
    get parcel_records_url
    assert_response :success
  end

  test "should get new" do
    get new_parcel_record_url
    assert_response :success
  end

  test "should create parcel_record" do
    assert_difference('ParcelRecord.count') do
      post parcel_records_url, params: { parcel_record: { file: @parcel_record.file } }
    end

    assert_redirected_to parcel_record_url(ParcelRecord.last)
  end

  test "should show parcel_record" do
    get parcel_record_url(@parcel_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_parcel_record_url(@parcel_record)
    assert_response :success
  end

  test "should update parcel_record" do
    patch parcel_record_url(@parcel_record), params: { parcel_record: { file: @parcel_record.file } }
    assert_redirected_to parcel_record_url(@parcel_record)
  end

  test "should destroy parcel_record" do
    assert_difference('ParcelRecord.count', -1) do
      delete parcel_record_url(@parcel_record)
    end

    assert_redirected_to parcel_records_url
  end
end
