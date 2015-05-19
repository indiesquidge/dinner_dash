require "rails_helper"
require "support/factory_girl"

RSpec.feature "Unauthenticated user can create an account", type: :feature do
	it "can successfully create a new account" do
		visit root_path
		click_link_or_button("Create An Account")
		fill_in("user[first_name]", with: "Richard")
		fill_in("user[last_name]", with: "Mejia")
		fill_in("user[email]", with: "richard@example.com")
		fill_in("user[password]", with: "password")
		fill_in("user[password_confirmation]", with: "password")
		click_link_or_button("Submit")
		expect(page).to have_content "My Account"
	end

	it "cannot create a new account with a missing first name" do
		visit new_user_path
		fill_in("user[first_name]", with: "")
		fill_in("user[last_name]", with: "Mejia")
		fill_in("user[email]", with: "richard@example.com")
		fill_in("user[password]", with: "password")
		fill_in("user[password_confirmation]", with: "password")
		click_link_or_button("Submit")
		expect(page).to have_content "Please fill in all fields."
	end

	it "cannot create a new account with a missing last name" do
		visit new_user_path
		fill_in("user[first_name]", with: "Richard")
		fill_in("user[last_name]", with: "")
		fill_in("user[email]", with: "richard@example.com")
		fill_in("user[password]", with: "password")
		fill_in("user[password_confirmation]", with: "password")
		click_link_or_button("Submit")
		expect(page).to have_content "Please fill in all fields."
	end

	it "cannot create a new account without an email" do
		visit new_user_path
		fill_in("user[first_name]", with: "Richard")
		fill_in("user[last_name]", with: "Mejia")
		fill_in("user[email]", with: "")
		fill_in("user[password]", with: "password")
		fill_in("user[password_confirmation]", with: "password")
		click_link_or_button("Submit")
		expect(page).to have_content "Please fill in all fields."
	end

	it "cannot create a new account without a password" do
		visit new_user_path
		fill_in("user[first_name]", with: "Richard")
		fill_in("user[last_name]", with: "Mejia")
		fill_in("user[email]", with: "richard@example.com")
		fill_in("user[password]", with: "")
		fill_in("user[password_confirmation]", with: "password")
		click_link_or_button("Submit")
		expect(page).to have_content "Please fill in all fields."
	end


	it "cannot create an account if that email is already has an account" do
		user = create(:user)

		visit new_user_path
		fill_in("user[first_name]", with: "Richard")
		fill_in("user[last_name]", with: "Mejia")
		fill_in("user[email]", with: "richard@example.com")
		fill_in("user[password]", with: "password")
		fill_in("user[password_confirmation]", with: "password")
		click_link_or_button("Submit")
		expect(page).to have_content "Please fill in all fields."
	end
end