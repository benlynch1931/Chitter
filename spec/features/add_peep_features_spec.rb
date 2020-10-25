feature "Allows user to add a new peep" do

  scenario "Input field for user's peep body" do
    visit('/peeps/new')
    expect(page).to have_field("peep_body")
  end

  scenario "Submit button to add user's peep" do
    visit('/peeps/new')
    expect(page).to have_button("Add Peep")
  end

  scenario "Submit links to new route" do
    visit('/peeps/new')
    fill_in("peep_body", with: "Feat Test Peep")
    click_button('add-peep')
    expect(current_path).to eq('/peeps')
  end

  scenario "Submit adds peep to database and displays" do
    visit('/peeps/new')
    fill_in("peep_body", with: "Feat Test Peep")
    click_button('add-peep')
    expect(page).to have_content("Feat Test Peep")
    expect(page).to have_content("#{Date.today.strftime('%Y-%m-%d')} - #{Time.now.strftime('%T')}")
  end
end
