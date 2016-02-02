feature 'Home page' do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
  end

  scenario 'visit the root page' do
    visit root_path
    expect(page).to have_content 'BabyBin and the Goat'
  end

  scenario 'entering correct reservation information', :js => true do

    visit root_path
    select '2016', :from => 'reservation[start_time(1i)]'
    select 'May', :from => 'reservation[start_time(2i)]'
    select '15', :from => 'reservation[start_time(3i)]'
    select '11 PM', :from => 'reservation[start_time(4i)]'
    select '6', :from => 'reservation[party_size]'
    fill_in 'reservation[name]', :with => 'Bob'
    page.execute_script("$('#reservation_restaurant_id').val('"+@restaurant.id.to_s+"')")

    find('#formSubmit').click
    expect(page).to have_css '.reservation-list-item'
    expect(page).to have_content('Reservation under: Bob')
    expect(page).to have_content('Party size: 6')
    expect(page).to have_content('Reserved for: May 15, 2016 at 11:00 PM')

  end

  scenario 'entering unfilled reservation information', :js => true do

    # Skip name input
    visit root_path
    select '2016', :from => 'reservation[start_time(1i)]'
    select 'May', :from => 'reservation[start_time(2i)]'
    select '15', :from => 'reservation[start_time(3i)]'
    select '11 PM', :from => 'reservation[start_time(4i)]'
    select '6', :from => 'reservation[party_size]'
    fill_in 'reservation[name]', :with => ''
    page.execute_script("$('#reservation_restaurant_id').val('"+@restaurant.id.to_s+"')")

    find('#formSubmit').click
    expect(page).not_to have_css '.reservation-list-item'
    expect(page).not_to have_content('Reservation under: Bob')
    expect(page).not_to have_content('Party size: 6')
    expect(page).not_to have_content('Reserved for: May 15, 2016 at 11:00 PM')

  end


  scenario 'entering past date reservation information', :js => true do

    # Past date
    visit root_path
    select '2016', :from => 'reservation[start_time(1i)]'
    select 'January', :from => 'reservation[start_time(2i)]'
    select '1', :from => 'reservation[start_time(3i)]'
    select '11 PM', :from => 'reservation[start_time(4i)]'
    select '6', :from => 'reservation[party_size]'
    fill_in 'reservation[name]', :with => 'Bob'
    page.execute_script("$('#reservation_restaurant_id').val('"+@restaurant.id.to_s+"')")

    find('#formSubmit').click
    expect(page).to have_css '#errorExplanation'
    expect(page).to have_content('Start time cannot be in past')
    expect(page).not_to have_content('Reservation under: Bob')
    expect(page).not_to have_content('Party size: 6')
    expect(page).not_to have_content('Reserved for: May 15, 2016 at 11:00 PM')

  end

end
