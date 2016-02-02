RSpec.describe ReservationsController, type: :controller do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
  end

  describe 'GET #index' do
    it "renders the index view" do
      get :index
      expect(response).to render_template("index")
    end

  end


  describe 'POST #create' do

    context 'with valid attributes' do

      it 'creates the reservation' do
        post :create, reservation: attributes_for(:reservation)
        expect(Reservation.count).to eq(1)
        expect(response).to have_http_status(:ok)
      end

    end


    context 'with invalid attributes' do

      it 'does not create the reservation due to blank name' do
        post :create, reservation: attributes_for(:reservation, name: nil)
        expect(Reservation.count).to eq(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create the reservation due to past time' do
        post :create, reservation: attributes_for(:reservation, start_time: Time.now-1.day)
        expect(Reservation.count).to eq(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end


    context 'with filled capacity' do

      before(:each) do
        @current_reservation = FactoryGirl.create(:six_person_reservation)
      end

      it 'does not create the reservation due to no capacity' do
        post :create, reservation: attributes_for(:six_person_reservation)
        expect(Reservation.count).to eq(1)
      end

    end

  end

end
