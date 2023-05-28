require 'swagger_helper'

RSpec.describe 'links', type: :request do

  path '/links' do

    get('list links') do
      consumes 'application/json'
      produces 'application/json'

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

    post('create link') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :params, in: :body, schema: {
        properties: {
          full: { type: :string },
          short: { type: :string }
        }
      }
      request_body_example value: { full: 'http://www.google.com', short: nil }

      response(200, 'successful') do
        let(:params) { { full: 'http://www.google.com', short: nil } }

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

  path '/links/new' do

    get('new link') do
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
  end

  path '/links/{id}/edit' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('edit link') do
      response(200, 'successful') do
        let(:id) { '123' }

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

  path '/links/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show link') do
      response(200, 'successful') do
        let(:id) { '123' }

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

    put('update link') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :params, in: :body, schema: {
        properties: {
          full: { type: :string },
          short: { type: :string }
        }
      }
      request_body_example value: { full: 'http://www.google.com', short: nil }

      response(200, 'successful') do
        let(:id) { 123 }
        let(:params) { { full: 'http://www.google.com', short: nil } }

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

    delete('delete link') do
      response(200, 'successful') do
        let(:id) { '123' }

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
