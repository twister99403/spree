require 'spec_helper'

describe "Inventory Settings" do
  stub_authorization!

  context "changing settings" do
    before(:each) do
      configure_spree_preferences do |config|
        config.allow_backorders = true
      end

      visit spree.admin_path
      click_link "Configuration"
      click_link "Inventory Settings"
    end

    it "should have the right content" do
      page.should have_content("Inventory Settings")
      page.should have_content("Allow Backorders")
    end

    it "should be able to toggle allowing backorders" do
      uncheck "preferences_allow_backorders"
      click_button "Update"
      assert_successful_update_message(:inventory_settings)
      assert_preference_unset(:allow_backorders)
    end
  end
end
