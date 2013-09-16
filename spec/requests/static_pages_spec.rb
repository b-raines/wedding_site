require 'spec_helper'

describe "StaticPages" do

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

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
    let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }
    before { visit guestbook_path }

    it { should have_content('Guestbook') }
    it { should have_title(full_title('Guestbook')) }

    describe "microposts" do
      it { should have_content(m1.content) }
      it { should have_content(m2.content) }
    end
  end
end
