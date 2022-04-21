# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Repositories', type: :request do
  describe 'GET /index' do
    let(:repository) do
      [
        {
          id: 2,
          node_id: 'swkkx9xcvb',
          name: 'Ramón-Saucedo-Treviño',
          full_name: 'Dr. Arturo Carranza Nájera',
          private: true,
          html_url: 'http://api.github.com/Abel-Arteaga-Bonilla/Ramón-Saucedo-Treviño',
          description: 'Quia rem voluptatem. Rem provident dolorum. Atque temporibus dolores.',
          forks_count: 1,
          stargazers_count: 1,
          license: nil,
          visibility: 'public',
          language: 'Js',
          topics: %w[topi1 topic2],
          ssh_url: nil,
          clone_url: nil,
          updated_at: nil,
          contributors_url: nil,
          subscribers_url: nil,
          subscription_url: nil,
          forks_url: nil,
          languages_url: nil,
          stargazers_url: nil
        }
      ].as_json
    end

    before(:each) do
      allow(Repository).to receive(:search).and_return(repository)
    end

    it 'gets repositories for yknx4' do
      get '/api/v1/repositories', params: { search_param: 'yknx4' }
      expect(response).to have_http_status(200)
    end
  end
end
