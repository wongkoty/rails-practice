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
feature "Static pages" do

	feature "Home page" do
		it "should have the content 'Sample App'" do 
			visit '/static_pages/home'
			page.should have_content('Sample App')
		end 

		it "should have the home title" do
			visit 'static_pages/home'
			page.should have_selector('title',
											:text => "Ruby on Rails Sample App | Home")
		end

		it "should not have the home title" do
			visit 'static_pages/home'
			page.should_not have_selector('title', :text => '| home')
		end
	end

	feature "Help page" do
		it "should have the content 'help'" do
			visit 'static_pages/help'
			page.should have_content('Help')
		end

		it "should have the help title" do
			visit 'static_pages/help'
			page.should have_selector('title',
											:text => "Ruby on Rails Sample App | Help")
		end
	end

	feature "About page" do

		it "should have the content 'About Us'" do
			visit 'static_pages/about'
			page.should have_content('About Us')
		end

		it "should have the about title" do
			visit 'static_pages/about'
			page.should have_selector('title',
											:text => "Ruby on Rails Sample App | About Us")
		end
	end

end
