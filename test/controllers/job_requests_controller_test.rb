require 'test_helper'

class JobRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_requests_index_url
    assert_response :success
  end

end
