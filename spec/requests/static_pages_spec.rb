require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /home' do
    before do
      get root_path
    end

    it '200のステータスが返ってくること' do
      expect(response).to have_http_status(200)
    end
  end
end
