require 'swagger_helper'

RSpec.describe 'redirect', type: :request do

  path '/{url}' do
    # You'll want to customize the parameter types...
    parameter name: 'url', in: :path, type: :string, description: 'url'

    get('list redirects') do
      response(200, 'successful') do
        let(:url) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
