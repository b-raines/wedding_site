require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Welcome') }
    it { should have_title('Sign In') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign In') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link 'Sign up now!' }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(full_title('')) }
      it { should have_link('Wedding Info', href: wedding_path) }
      it { should have_link('Bridal Party', href: party_path) }
      it { should have_link('Guestbook', href: guestbook_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      it { should_not have_link('Sign up now!', href: signup_path) }

      describe "followed by signout" do
        before { click_link 'Sign out' }
        it { should have_button('Sign in') }
      end
    end
  end
end
