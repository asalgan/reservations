feature 'Home page' do

  scenario 'visit the root page' do
    visit root_path
    expect(page).to have_content 'BabyBin and the Goat'
  end

  scenario 'entering reservation information' do
    visit root_path
    select 'reservation[start_time(1i)]', :with => '2016'
    select 'reservation[start_time(2i)]', :with => '05'
    select 'reservation[start_time(3i)]', :with => '05'
    select 'reservation[start_time(4i)]', :with => ''
    select 'reservation[start_time(5i)]', :with =>
    fill_in 'reservation[party_size]', :with =>
    fill_in 'reservation[name]', :with =>
    fill_in 'reservation[restaurant_id]', :with =>

  end

end
