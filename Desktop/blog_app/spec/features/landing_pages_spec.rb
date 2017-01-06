require 'rails_helper'
# Tests if I can see posted blogs on the landing page.
RSpec.feature "LandingPages", type: :feature do
  context 'Landing page' do
    Steps 'Going to landing page' do
      Given 'I visit local host 3000' do
        visit '/'
      end
      Then 'I can see Posts' do
        expect(page).to have_content("Posts")
      end
    end
  end

  context "Signing up" do
    Steps "To sign up" do
      Given "I am on the landing page" do
        visit "/"
      end
      Then "I can sign up" do
        click_link "Sign Up"
      end
      Then "I am taken to the Sign Up page" do
        fill_in "Email", with: "bob@bob.bob"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_link "Sign up"
      end
      Then "I am taken to the Successful sign up page" do
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
    end
  end
# Tests if I can write a new blog.
  context 'New blog' do
    Steps 'To write a new blog' do
      Given 'I am on the landing page' do
        visit '/'
      end
        expect(page).to have_content("New Post")
      And 'I can create a new post' do
        click_link "New Post"
      end
      Then "I am taken to the new post page" do
        expect(page).to have_content("New Post")
      end
      And "I can fill out the New Post form" do
        fill_in "User", with: "Bob"
        fill_in "Blog", with: "Hello, This is Bob's blog."
        fill_in "Comment", with: "Thank you for reading!"
      end
      Then "I can create a new blog post" do
        click_button("Create Post")
      end
      And "I am taken to Post Successful page" do
        expect(page).to have_content("Post was successfully created.")
        expect(page).to have_content("Bob")
        expect(page).to have_content("Hello, This is Bob's blog.")
        expect(page).to have_content("Thank you for reading!")
      end
      # Then "I can edit my posts" do
      #   click_button("Edit")
      # end
      # And "I am taken to the Editing Post page" do
      #   expect(page).to have_content("Editing Post")
      # end
    end
  end

  # context "I can edit posts"
  #   Steps "To edit a post" do
  #     Given "I visit localhost:3000" do
  #       visit "/"
  #     end
  #     Then "I can write a knew post" do
  #       click_button('New Post')
  #       fill_in "User", with: "Bob"
  #       fill_in "Blog", with: "Hello, This is Bob's blog."
  #       fill_in "Comment", with: "Thank you for reading!"
  #       click_button("Create Post")
  #     end
  #     And "I am taken to the Successful Posts page" do
  #       expect(page).to have_content("Post was successfully created.")
  #       expect(page).to have_content("Bob")
  #       expect(page).to have_content("Hello, This is Bob's blog.")
  #       expect(page).to have_content("Thank you for reading!")
  #     end
  #
  #   end
  # end
end
