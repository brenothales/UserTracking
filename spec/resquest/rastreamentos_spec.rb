require 'rails_helper'

RSpec.describe "Rastreamentos API", :type => :request do
  context 'create rastreamento' do
    context 'with invalid parameters' do
      it "post without visitante parameter" do
        post_params = {rastreamento: {url: '/', titulo: "Home", data_hora:"10:01:02"}}
        post rastreamentos_path(post_params), { :format => :json }
        expect(response).to have_http_status(:bad_request)

        json = JSON.parse(response.body)
        expect(json['mensagem']).to eq 'Parâmetro visitante inexistente.'
      end
      it "post without url parameter" do
        post_params = {rastreamento: {visitante: 'visistante A', titulo: "Home", data_hora:"10:01:02"}}
        post rastreamentos_path(post_params), { :format => :json }
        expect(response).to have_http_status(:bad_request)

        json = JSON.parse(response.body)
        expect(json['mensagem']).to eq 'Parâmetro url inexistente.'
      end
      it "post without título parameter" do
        post_params = {rastreamento: {visitante: "visitante A", url: '/', data_hora:"10:01:02"}}
        post rastreamentos_path(post_params), { :format => :json }
        expect(response).to have_http_status(:bad_request)

        json = JSON.parse(response.body)
        expect(json['mensagem']).to eq 'Parâmetro título inexistente.'
      end
      it "post without data/hora parameter" do
        post_params = {rastreamento: {visitante: "visitante A", url: '/', titulo: "Home"}}
        post rastreamentos_path(post_params), { :format => :json }
        expect(response).to have_http_status(:bad_request)

        json = JSON.parse(response.body)
        expect(json['mensagem']).to eq 'Parâmetro data/hora inexistente.'
      end
    end
    context 'with valid parameters' do
      it "complete post" do
        expect{
          post_params = {rastreamento: {visitante: "visitante A", url: '/', titulo: "Home", data_hora:"10:01:02"}}
          post rastreamentos_path(post_params), { :format => :json }
          expect(response).to have_http_status(:created)
        }.to change(Rastreamento, :count).by(1)
        expect{
          post_params = {rastreamento: {visitante: "visitante A", url: '/', titulo: "Home", data_hora:"10:01:02"}}
          post rastreamentos_path(post_params), { :format => :json }
          expect(response).to have_http_status(:created)
        }.to change(Rastreamento, :count).by(1)
      end
    end
  end
end
