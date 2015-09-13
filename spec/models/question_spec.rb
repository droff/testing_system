require 'spec_helper'

describe Question do
  describe 'radioButton' do
    subject { create(:question_radio) }
    let(:attr) { attributes_for(:question_radio) }

    it '#answers' do
      expect(subject.answers).to eq attr[:answers]
    end

    it '#correct_answers' do
      expect(subject.correct_answers).to eq attr[:correct_answers]
    end
  end

  describe 'textInput' do
    subject { create(:question_text) }
    let(:attr) { attributes_for(:question_text) }

    it '#answers' do
      expect(subject.answers).to eq attr[:answers]
    end

    it '#correct_answers' do
      expect(subject.correct_answers).to eq attr[:correct_answers]
    end
  end

  describe 'checkboxInput' do
    subject { create(:question_checkbox) }
    let(:attr) { attributes_for(:question_checkbox) }

    it '#answers' do
      expect(subject.answers).to eq attr[:answers]
    end

    it '#correct_answers' do
      expect(subject.correct_answers).to eq attr[:correct_answers]
    end
  end
end
