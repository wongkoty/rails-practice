require 'rails_helper'

# RSpec.describe "StaticPages", type: :request do
#   describe "GET /static_pages" do
#     it "works! (now write some real specs)" do
#       get static_pages_index_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
# require 'spec helper' describe "Static pages" do
# describe "Home page" do
# it "should have the content 'Sample App'" do visit '/static pages/home'
# page.should have content('Sample App')
# end end
# end

require 'spec_helper' 

describe "User pages" do

  subject { page }

  describe "index" do
  	# before do
  	# 	sign_in FactoryGirl.create(:user)
  	# 	FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
  	# 	FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
  	# 	visit users_path
  	# end
  	let(:user) { FactoryGirl.create(:user) }

  	before(:each) do
  		sign_in user
  		visit users_path
  	end

  	it { should have_selector('title', text: 'All users') }
  	it { should have_selector('h1', text: 'All users') }

  	describe "pagination" do

  		it { should have_selector('div.pagination') }

  		it "should list each user" do
  			User.paginate(page: 1).each do |user|
  				page.should have_selector('li', text: user.name)
  			end
  		end
  	end

  	describe "delete links" do

  		it { should_not have_link('delete') }

  		describe "as an admin user" do
  			let(:admin) { FactoryGirl.create(:admin) }
  			before do
  				sign_in admin
  				visit users_path
  			end

  			it {should have_link('delete', href: user_path(User.first)) }
  			it "should be able to delete another user" do
  				expect { click_link('delete') }.to change(User, :count).by(-1)
  			end
  			it { should_not have_link('delete', href: user_path(admin)) }
  		end
  	end
  end

	describe "signup page" do 
		before { visit signup_path }

		it { should have_selector('title', text: full_title('Sign up')) }
		it { should have_selector('h1', text: 'Sign up') }
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		# before { visit edit_user_path(user) }

		before do
			sign_in user
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_selector('h1', text: "Update your profile") }
			it { should have_selector('title', text: "Edit user") }
			it { should have_link('change', href: "http://gravatar.com/emails")}
		end

		describe "with valid information" do
			let(:new_name) { "New Name" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "Name", with: new_name
				fill_in "Email", with: new_email
				fill_in "Password", with: user.password
				fill_in "Confirm Password", with: user.password
				click_button "Save changes"
			end

			it { should have_selector('title', text: new_name) }
			it { should have_selector('div.alert.alert-success') } 
			it { should have_link('Sign out', href: signout_path) } 
			specify { user.reload.name.should == new_name } 
			specify { user.reload.email.should == new_email }


		end


		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end  
	end


end
