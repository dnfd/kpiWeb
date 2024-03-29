require 'swagger_helper'

RSpec.describe 'users', type: :request do
  path '/users' do
    get('list users') do
      security [cookie_auth: []]
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

    post('create user') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :params, in: :body, schema: {
        properties: {
          email: { type: :string },
          password: { type: :string },
          first_name: { type: :string },
          last_name: { type: :string },
          dob: { type: :string },
          gender: { type: :string }
        }
      }
      request_body_example value: {
        email: 'test@test.com',
        password: 'password',
        first_name: 'Test',
        last_name: 'Testenko',
        dob: '07-05-1993',
        gender: 'male'
      }

      response(200, 'successful') do
        let(:params) do
          {
            email: 'test@test.com',
            password: 'password',
            first_name: 'Test',
            last_name: 'Testenko',
            dob: '07-05-1993',
            gender: 'male'
          }
        end

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

  # path '/users/new' do
  #   get('new user') do
  #     response(200, 'successful') do

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  # path '/users/{id}/edit' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'

  #   get('edit user') do
  #     security [cookie_auth: []]
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  path '/users/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show user') do
      security [cookie_auth: []]
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

    put('update user') do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :params, in: :body, schema: {
        properties: {
          email: { type: :string },
          password: { type: :string },
          first_name: { type: :string },
          last_name: { type: :string },
          dob: { type: :string },
          gender: { type: :string }
        }
      }
      request_body_example value: {
        email: 'test@test.com',
        password: 'password',
        first_name: 'Test',
        last_name: 'Testenko',
        dob: '07-05-1993',
        gender: 'male'
      }
      security [cookie_auth: []]

      response(200, 'successful') do
        let(:params) do
          {
            email: 'test@test.com',
            password: 'password',
            first_name: 'Test',
            last_name: 'Testenko',
            dob: '07-05-1993',
            gender: 'male'
          }
        end
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

    delete('delete user') do
      security [cookie_auth: []]
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
