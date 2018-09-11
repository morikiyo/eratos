require 'spec_helper'

describe Eratos do
  describe '#generate' do
    it { expect(Eratos.generate(30)).to eq [2,3,5,7,11,13,17,19,23,29]}
  end
end
