require 'spec_helper'

describe "StaticPages" do

  let(:user) { FactoryGirl.create(:user) }
  before do
    ApplicationController.any_instance.stub(:signed_in?).and_return(true)
  end

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Welcome')}
    it { should have_title(full_title(''))}
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
