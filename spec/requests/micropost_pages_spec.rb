require 'spec_helper'

describe "MicropostPages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit guestbook_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do
      before { visit guestbook_path }

      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end

    describe "as admin user" do
      let(:admin_user) { FactoryGirl.create(:user, admin: true) }
      before do
        sign_in admin_user
        visit guestbook_path
      end

      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end
  end
end
