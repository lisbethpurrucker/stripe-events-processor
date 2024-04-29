require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get root_path
      expect(response).to be_successful
    end
  end
end
