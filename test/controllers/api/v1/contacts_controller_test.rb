require 'test_helper'

class Api::V1::ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_contact = api_v1_contacts(:one)
  end

  test "should get index" do
    get api_v1_contacts_url, as: :json
    assert_response :success
  end

  test "should create api_v1_contact" do
    assert_difference('Contact.count') do
      post api_v1_contacts_url, params: { api_v1_contact: { email: @api_v1_contact.email, name: @api_v1_contact.name, phone: @api_v1_contact.phone } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_contact" do
    get api_v1_contact_url(@api_v1_contact), as: :json
    assert_response :success
  end

  test "should update api_v1_contact" do
    patch api_v1_contact_url(@api_v1_contact), params: { api_v1_contact: { email: @api_v1_contact.email, name: @api_v1_contact.name, phone: @api_v1_contact.phone } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_contact" do
    assert_difference('Contact.count', -1) do
      delete api_v1_contact_url(@api_v1_contact), as: :json
    end

    assert_response 204
  end
end
