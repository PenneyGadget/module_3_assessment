require "rails_helper"

RSpec.feature "Root page search", :type => :feature do
  scenario "A user can search for an item" do
    VCR.use_cassette("root_page_search") do
      visit root_path
      save_and_open_page
      fill_in "Search for an item:", with: "Sennheiser"
      click_on "Search!"

      expect(current_path).to eq("/search")

      # expect results to eq 15
      expect(page).to have_content("sku")
      expect(page).to have_content("name")
      expect(page).to have_content("customer average review")
      expect(page).to have_content("short description")
      expect(page).to have_content("sale price")
      expect(page).to have_content("image_url")
    end
  end
end
