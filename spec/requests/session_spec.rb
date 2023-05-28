require 'swagger_helper'

RSpec.describe 'session', type: :request do
  path '/session' do
    delete('delete session') do
      response(200, 'successful') do
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

    post('create session') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :params, in: :body, schema: {
        properties: {
          email: { type: :string },
          password: { type: :string }
        }
      }
      parameter name: 'Accept', in: :header, type: :string
      request_body_example value: { email: 'test@test.com', password: 'password' }

      response(200, 'successful') do
        let(:params) { { email: 'test@test.com', password: 'password' } }

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
