require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    create_list(:user, 2)
    @users = User.all.decorate
    assign(:users, @users)

    render
  end

  context "renders a list of users" do
    it do
      @users.each do |user|
        assert_select "tr#user-#{user.id}" do
          assert_select "td.email"
          assert_select "td.joined_at"
          assert_select "td a[href='#{user_path(user)}']"
          assert_select "td a[href='#{edit_user_path(user)}']"
        end
      end
    end
  end
end
