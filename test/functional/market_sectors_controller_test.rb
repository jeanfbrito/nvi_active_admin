require 'test_helper'

class MarketSectorsControllerTest < ActionController::TestCase
  setup do
    @market_sector = market_sectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:market_sectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create market_sector" do
    assert_difference('MarketSector.count') do
      post :create, market_sector: { blurb: @market_sector.blurb, body: @market_sector.body, name: @market_sector.name }
    end

    assert_redirected_to market_sector_path(assigns(:market_sector))
  end

  test "should show market_sector" do
    get :show, id: @market_sector
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @market_sector
    assert_response :success
  end

  test "should update market_sector" do
    put :update, id: @market_sector, market_sector: { blurb: @market_sector.blurb, body: @market_sector.body, name: @market_sector.name }
    assert_redirected_to market_sector_path(assigns(:market_sector))
  end

  test "should destroy market_sector" do
    assert_difference('MarketSector.count', -1) do
      delete :destroy, id: @market_sector
    end

    assert_redirected_to market_sectors_path
  end
end
