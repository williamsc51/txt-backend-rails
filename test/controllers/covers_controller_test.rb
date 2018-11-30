require 'test_helper'

class CoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cover = covers(:one)
  end

  test "should get index" do
    get covers_url, as: :json
    assert_response :success
  end

  test "should create cover" do
    assert_difference('Cover.count') do
      post covers_url, params: { cover: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show cover" do
    get cover_url(@cover), as: :json
    assert_response :success
  end

  test "should update cover" do
    patch cover_url(@cover), params: { cover: {  } }, as: :json
    assert_response 200
  end

  test "should destroy cover" do
    assert_difference('Cover.count', -1) do
      delete cover_url(@cover), as: :json
    end

    assert_response 204
  end
end
