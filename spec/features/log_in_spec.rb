require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Pages Testing" do

  before do
    visit new_user_session_path
  end

  context 'checking with unlogged user' do
    it 'shows "Log in"' do
      expect(page).to have_content('Log in')
    end
  end

  let(:logged_user) { FactoryGirl.create(:logged_user) }

  context 'checking with logged user' do

    before do
      fill_in 'Email', with: logged_user.email
      fill_in 'Password', with: logged_user.password
      element = page.find(".actions input")
      element.click
    end

    it 'shows "Edit profile"' do
      visit root_path
      expect(page).to have_content(logged_user.email)
    end
  end
end
