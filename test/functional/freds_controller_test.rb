require 'test_helper'

class FredsControllerTest < ActionController::TestCase
  setup do
    @fred = freds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:freds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fred" do
    assert_difference('Fred.count') do
      post :create, fred: @fred.attributes
    end

    assert_redirected_to fred_path(assigns(:fred))
  end

  test "should show fred" do
    get :show, id: @fred.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fred.to_param
    assert_response :success
  end

  test "should update fred" do
    put :update, id: @fred.to_param, fred: @fred.attributes
    assert_redirected_to fred_path(assigns(:fred))
  end

  test "should destroy fred" do
    assert_difference('Fred.count', -1) do
      delete :destroy, id: @fred.to_param
    end

    assert_redirected_to freds_path
  end
end
