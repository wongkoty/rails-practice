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

subject { page }
	feature "Home page" do
		before { visit root_path }

		it { should have_content('Sample App') }
		it { should have_selector('title',
											:text => full_title('')) }
		it { should_not have_selector('title', text: '| Home', exact: true) }
	end

	feature "Help page" do
		before { visit help_path }

		it { should have_content('Help') }
		it { should have_selector('title',
											:text => full_title('')) }
	end

	feature "About page" do
		before { visit about_path}

		it { should have_content('About Us') }
		it { should have_selector('title',
											:text => full_title('')) }
	end

	feature "contact page" do
		before { visit contact_path }

		it { should have_selector('title',
											:text => full_title('')) }
	end

end
