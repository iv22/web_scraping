require 'rails_helper'

RSpec.describe OnlinerMoodController, type: :controller do
  let(:data_headers) { ['Год', 'Коэффициент'] }

  describe 'GET #index' do
    context 'when exists any Content data' do
      let(:data_expected) { ['2021', -4.53044300237] }

      before do
        FactoryBot.create(:content, :onliner, year: Integer(data_expected[0]), mood: data_expected[1])
        get :index
      end

      it 'should render index' do
        expect(response).to render_template(:index)
      end

      it 'should set expected @data attribute' do
        expect(assigns(:data)).to eq([data_headers, data_expected])
      end
    end

    context 'when not exists any Content data' do
      before do
        get :index
      end

      it 'should set expected @data attribute' do
        expect(assigns(:data)).to eq([data_headers])
      end
    end
  end
end
