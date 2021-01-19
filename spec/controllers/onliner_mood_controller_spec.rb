require 'rails_helper'
require 'shared_content'

RSpec.describe OnlinerMoodController, type: :controller do
  include_context 'shared content data'

  describe 'GET #index' do
    context 'when exists any Content data' do
      before do
        create_onliner_content
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
