require 'rails_helper'

RSpec.describe "Signup/Signin/Signout", type: :feature do

   context 'signing up' do
      scenario "signup" do
         visit root_path
         click_link "Sign in"
         wait_for{ page }.to have_current_path(new_user_session_path)
         click_link "Sign up"
         wait_for{ page }.to have_current_path(new_user_registration_path)
         fill_in "user[email]",    with: Faker::Internet.email
         fill_in "user[password]", with: 'password'
         fill_in "user[password_confirmation]", with: 'password'
         click_button "Sign up"
         wait_for{ page }.to have_current_path(root_path)
         expect(page.status_code).to be_eql 200
         expect(page.body).to have_text(/Signout/)
      end
   end

   context 'signing in' do
      before( :each ) do
         @user = FactoryGirl.create( :user )
      end

      scenario "login and logout" do
         visit root_path
         click_link "Sign in"
         fill_in "Email",    with: @user.email
         fill_in "Password", with: @user.password
         click_button "Log in"
         wait_for{ page }.to have_current_path(root_path)
         expect(page.status_code).to be_eql 200
         expect(page.body).to have_text(/Signout/)
         expect(page.body).to have_text(@user.email)

         click_link "Signout"
         wait_for{ page }.to have_current_path(root_path)
         expect(page.status_code).to be_eql 200
         expect(page.body).to have_text(/Sign in/)
      end
   end
end
