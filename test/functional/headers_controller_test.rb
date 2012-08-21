require 'test_helper'

class HeadersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Header.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Header.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Header.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to header_url(assigns(:header))
  end

  def test_edit
    get :edit, :id => Header.first
    assert_template 'edit'
  end

  def test_update_invalid
    Header.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Header.first
    assert_template 'edit'
  end

  def test_update_valid
    Header.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Header.first
    assert_redirected_to header_url(assigns(:header))
  end

  def test_destroy
    header = Header.first
    delete :destroy, :id => header
    assert_redirected_to headers_url
    assert !Header.exists?(header.id)
  end
end
