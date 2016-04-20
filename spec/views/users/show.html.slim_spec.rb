require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, create(:user))

    render
  end

  context "renders attributes and links" do
    it { expect(rendered).to match("Hail, #{@user.email}") }
    it { expect(rendered).to match("Edit") }
    it { expect(rendered).to match("Back") }
  end
end
