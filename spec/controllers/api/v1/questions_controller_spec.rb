require 'spec_helper'

# user request: { checksum: { value: q_value } }
# example:
#   radio     { '1234567890': { 'value': ['a'] } }
#   text      { '1234567891': { 'value': ['1'] } }
#   checkbox  { '1234567892': { 'value': ['a', c'] } }

describe Api::V1::QuestionsController, type: :controller do
  before do
    @qr = create(:question_radio)
    @qt = create(:question_text)
    @qc = create(:question_checkbox)

    @answer_radio    = { @qr.checksum.to_s => { 'value' => ['b'] } }
    @answer_text     = { @qt.checksum.to_s => { 'value' => ['15'] } }
    @answer_checkbox = { @qc.checksum.to_s => { 'value' => ['a', 'b'] } }

    @user_answer_text = { "value" => '15', "correct" => false }
  end

  describe 'GET api/v1/questions' do
    it 'response to json' do
      get :index, format: :json
      expect(parsed_response.first['question']).to eq @qr.title
    end

    it { expect(response.status).to eq 200 }
  end

  describe 'POST api/v1/questions' do
    it 'post answer' do
      post :create, json: [ @answer_radio ]
      expect(response.status).to eq 200
    end

    it 'response with json' do
      post :create, json: [ @answer_radio , @answer_text , @answer_checkbox ]
      expect(parsed_response.first['user_answer_correct']['correct']).to be_truthy
      expect(parsed_response[1]['user_answer']).to eq @user_answer_text
    end

    it 'json nil' do
      post :create, json: nil
      expect(response.status).to eq 400
    end

    it 'value nil' do
      post :create, json: [ { @qr.checksum => { value: nil } } ]
      expect(response.status).to eq 400
    end

  end
end
