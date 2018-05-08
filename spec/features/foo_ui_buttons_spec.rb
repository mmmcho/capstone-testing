require 'rails_helper'

RSpec.feature "FooUiButtons", type: :feature, :js=>true do
  scenario "Create button disabled when no name" do
    visit root_path
    within(:xpath,FOO_FORM_XPATH) do
      expect(find_field("name", :with=> ""))
      expect(find_button("Create Foo", :disabled=> true))
      fill_in("name", :with=>"test")
      expect(find_button("Create Foo", :disabled=> false))
    end

  end
end
