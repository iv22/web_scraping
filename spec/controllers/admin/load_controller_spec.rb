require "rails_helper"

RSpec.describe Admin::LoadController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @article_type = FactoryBot.create(:content_type, :article)
    @vacancy_type = FactoryBot.create(:content_type, :vacancy)
    admin = FactoryBot.create(:admin)
    sign_in(admin, scope: :admin)
  end

  it "should have a current admin_user" do
    expect(subject.current_admin).to_not eq(nil)
  end

  describe 'GET #index' do
    before do
      get :index
    end

    it 'should get status 200' do
      expect(response.status).to eq 200
    end

    it 'should render index' do            
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #onliner' do

    context "when all params are valid" do
      let(:params) { { start_date: '2020/12/24', end_date: '2020/12/30' } }
      
      before do
        post :onliner, params: params
      end

      it "should launch the 'onliner' scraping worker" do
        expect(AddScrapingWorker).to have_enqueued_sidekiq_job( \
          @article_type.id, 'OnlinerNews', '2020/12/24', '2020/12/30')
      end
    end

    context "when pass some invalid params" do
      let(:params) { { start_date: '2020/12/30', end_date: '2020/12/24' } }
      
      before do
        post :onliner, params: params
      end
      
      it "shouldn't launch the 'onliner' scraping worker" do
        expect(AddScrapingWorker).not_to have_enqueued_sidekiq_job( \
          @article_type.id, 'OnlinerNews', '2020/12/30', '2020/12/24')
      end
    end  
  end

  describe 'POST #rabotaby' do
    let(:params) { { criteria: 'ruby' } }
    before do
      post :rabotaby, params: params
    end

    it "should launch the 'rabotaby' scraping worker" do
      expect(AddScrapingWorker).to have_enqueued_sidekiq_job( \
        @vacancy_type.id, 'RabotaBy', 'ruby')
    end
  end
end