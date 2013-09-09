require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Welcome')}
    it { should have_title(full_title(''))}
  end

  describe "Signup page" do
    before { visit signup_path }

    it { should have_content('Sign up')}
    it { should have_title(full_title('Sign Up'))}
  end

  describe "Wedding info page" do
    before { visit wedding_path }

    it { should have_content('Venue')}
    it { should have_title(full_title('Wedding Info'))}
  end

  describe "Bridal party page" do
    before { visit party_path }

    it { should have_content('Bridesmaids')}
    it { should have_title(full_title('Bridal Party'))}
  end

  describe "Guestbook page" do
    before { visit guestbook_path }

    it { should have_content('Guestbook')}
    it { should have_title(full_title('Guestbook'))}
  end
end
