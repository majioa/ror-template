require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, create(:user))

    render
  end

  context "renders the edit user form" do
    it do
      assert_select "form[action=?][method=?]", user_path(@user), "post" do
        assert_select "input[name=?]", "_method"
        assert_select "label[for=?]", "user_email"
        assert_select "input[name=?]", "user[email]"
        assert_select "input[name=?]", "commit"
      end
    end
  end
end
