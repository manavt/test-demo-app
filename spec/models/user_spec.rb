# frozen_string_literal: true
require "rails_helper"

describe User, type: :model do
  subject { described_class.find_by(name: 'Bike sharing') }

  context 'Basic data types' do
    it 'has a name property' do
      expect(subject.name).to eq 'Bike sharing'
    end

    it 'has a image' do
      image = Image.find(subject.image.id.to_s)
      expect(image).to be_a(Image)
    end
  end
end

