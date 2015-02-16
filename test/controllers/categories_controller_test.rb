require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

	test "show" do
		category = Fabricate(:category)
		good_post = Fabricate(:post, categories: [category])
		bad_post = Fabricate(:post)
		get :show, id: category
		assert_response :success
		assert_equal category, assigns(:category)
		assert_equal [good_post], assigns(:posts)
	end
end