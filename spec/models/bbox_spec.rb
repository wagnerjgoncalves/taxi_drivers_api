require 'rails_helper'

describe Bbox do
  let(:polygon) do
    "POLYGON ((-46.673392 -23.589548,-46.702746 -23.589548,-46.702746 -23.612474,-46.673392 -23.612474,-46.673392 -23.589548))"
  end

  subject do
    Bbox.new('-23.589548,-46.673392', '-23.612474,-46.702746')
  end

  describe '#to_s' do
    it "should render EWKT Polygon" do
      expect(subject.to_s).to eq polygon
    end
  end
end
