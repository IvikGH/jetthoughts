require 'rails_helper'
p '/spec/features/comments_post_spec.rb'
describe 'Pages Testing' do

  before do
    visit new_user_session_path
  end

  context 'with unlogged user' do
  end

  let(:logged_user) { FactoryGirl.create(:logged_user) }

  context 'with logged user' do

    before do
      fill_in 'Email', with: logged_user.email
      fill_in 'Password', with: logged_user.password
      element = page.find('.actions input')
      element.click

    end

    it 'link "New post" shows page for adding post ' do
      visit root_path
      click_link('New Post')

      expect(page).to have_content('New post')
      expect(page).to have_content('Image')
      expect(page).to have_content('Title')
      expect(page).to have_content('Description')
      expect(page).to have_content('User')
    end

    scenario 'creates new comment' do
      visit root_path
      visit new_post_path

      # save_page
      title = 'Rspec testing awesome application'
      description = 'Rspec new post description'

      fill_in 'Title', with: title
      fill_in 'post_description', with: description
      click_on 'Save'

      comment = 'my awesome comment'
      fill_in 'comment_body', with: comment
      click_on 'Create Comment'

      post = Post.last
      visit post_path(id: post.id)

      expect(page).to have_content(comment)
    end
  end
end
