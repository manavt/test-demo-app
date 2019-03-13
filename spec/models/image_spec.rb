require "rails_helper"

describe Image, type: :model do
  subject { described_class.find_by(photo_file_name: 'Paragliding-in-Pokhara_2.jpg') }

  context 'Basic data types' do
    it 'has a name property' do
      expect(subject.photo_file_name).to eq 'Paragliding-in-Pokhara_2.jpg'
    end

    it 'has a image' do
      expect(subject).to respond_to :entity	
    end
  end
end
