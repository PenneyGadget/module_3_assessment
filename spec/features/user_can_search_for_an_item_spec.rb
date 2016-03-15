require "rails_helper"

RSpec.feature "Root page search", :type => :feature do
  scenario "A user can search for an item" do
    VCR.use_cassette("root_page_search") do
      visit root_path

      fill_in "product", with: "sennheiser"
      click_on "Search!"

      expect(current_path).to eq("/search")

      expect(page).to have_content("Your Search Returned 15 Items")
      expect(page).to have_content("Sku")
      expect(page).to have_content("Name")
      expect(page).to have_content("Customer Average Review")
      expect(page).to have_content("Description")
      expect(page).to have_content("Sale Price")
      expect(page).to have_css("img")
    end
  end
end
