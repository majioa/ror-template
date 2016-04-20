require 'rails_helper'

RSpec.describe User, type: :model do
   context "shoulda" do
      it { expect(subject).to have_db_column(:name).of_type(:string) }

      it { expect(subject).to have_db_column(:encrypted_password).of_type(:string) }

      it { expect(subject).to have_db_column(:reset_password_token).of_type(:string) }

      it { expect(subject).to have_db_column(:current_sign_in_ip).of_type(:string) }

      it { expect(subject).to have_db_column(:last_sign_in_ip).of_type(:string) }

      it { expect(subject).to have_db_column(:email).of_type(:string) }
      it { expect(subject).to validate_presence_of(:email) }

      it { expect(subject).to have_db_column(:reset_password_sent_at).of_type(:datetime) }

      it { expect(subject).to have_db_column(:remember_created_at).of_type(:datetime) }

      it { expect(subject).to have_db_column(:current_sign_in_at).of_type(:datetime) }

      it { expect(subject).to have_db_column(:last_sign_in_at).of_type(:datetime) }

      it { expect(subject).to have_db_column(:sign_in_count).of_type(:integer) }
   end

   # NOTE: for matchers see https://github.com/rspec/rspec-rails
   context "creates" do
      before do
         @user = build :user
      end

      it { expect(@user).to be_a_new(User) }
      it { expect(@user).to be_valid }
   end

   context "can't create" do
      before do
         @user = build :invalid_user
      end

      it { expect(@user).to_not be_valid }
   end

   context "duplicate user" do
      let(:user) { build :user, email: 'mail@mail.com' }

      before do
         create :user, email: 'mail@mail.com'
      end

      it { expect(user).to_not be_valid }
   end
end
