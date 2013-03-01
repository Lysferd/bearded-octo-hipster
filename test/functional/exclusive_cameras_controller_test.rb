require 'test_helper'

class ExclusiveCamerasControllerTest < ActionController::TestCase
  setup do
    @exclusive_camera = exclusive_cameras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exclusive_cameras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exclusive_camera" do
    assert_difference('ExclusiveCamera.count') do
      post :create, exclusive_camera: {camera_id: @exclusive_camera.camera_id, label: @exclusive_camera.label, server_id: @exclusive_camera.server_id}
    end

    assert_redirected_to exclusive_camera_path(assigns(:exclusive_camera))
  end

  test "should show exclusive_camera" do
    get :show, id: @exclusive_camera
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exclusive_camera
    assert_response :success
  end

  test "should update exclusive_camera" do
    put :update, id: @exclusive_camera, exclusive_camera: {camera_id: @exclusive_camera.camera_id, label: @exclusive_camera.label, server_id: @exclusive_camera.server_id}
    assert_redirected_to exclusive_camera_path(assigns(:exclusive_camera))
  end

  test "should destroy exclusive_camera" do
    assert_difference('ExclusiveCamera.count', -1) do
      delete :destroy, id: @exclusive_camera
    end

    assert_redirected_to exclusive_cameras_path
  end
end
