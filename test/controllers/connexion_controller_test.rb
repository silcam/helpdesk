require 'test_helper'

class ConnexionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get connexion_index_url
    assert_response :success
  end

end
