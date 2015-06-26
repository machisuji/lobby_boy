require 'spec_helper'

describe LoginController, type: :controller do
  describe 'test' do
    it 'renders "hallo welt"' do
      get 'test'

      expect(response.body).to eq 'hallo welt'
    end
  end
end
