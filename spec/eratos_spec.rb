require 'spec_helper'

describe Eratos do
  describe '#generate' do
    context 'argument validation test' do
      example 'minimam prime number list' do
        expect(Eratos.generate(2)).to eq [2]
        expect(Eratos.generate('2')).to eq [2]
      end
      example 'argument error' do
        errmsg = "specify an integer 2 and more to argument."
        expect{ Eratos.generate(1) }.to raise_error(ArgumentError, errmsg)
        expect{ Eratos.generate(-2) }.to raise_error(ArgumentError, errmsg)
        expect{ Eratos.generate(nil) }.to raise_error(ArgumentError, errmsg)
        expect{ Eratos.generate("") }.to raise_error(ArgumentError, errmsg)
        expect{ Eratos.generate("x") }.to raise_error(ArgumentError, errmsg)
      end
    end

    context 'loop condition test' do
      example 'boundaly value of search end value' do
        expect(Eratos.generate(4)).to eq [2,3]
      end
      example 'greater than boundaly value' do
        expect(Eratos.generate(3)).to eq [2,3]
      end
      example 'less than boundaly value' do
        expect(Eratos.generate(5)).to eq [2,3,5]
      end
    end

    context 'normal operation' do
      example 'prime numbers less than specified number.' do
        expected = [2,3,5,7,11,13,17,19,23,29]
        expect(Eratos.generate(30)).to eq expected

        expected = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113]
        expect(Eratos.generate(120)).to eq expected
      end
    end
  end

  describe "Command Line" do
    target_file = "eratos.rb"
    let(:command) { File.join(File.dirname(__FILE__), "..", target_file) }

    context 'invalid count of command-line args' do
      example 'print usage' do
        expected = "usage: ruby #{target_file} number\n"
        expect(`ruby #{command}`).to eq expected
        expect(`ruby #{command} 2 3`).to eq expected
      end
    end

    context 'normal operation' do
      example 'print to stdout as in the problem example' do
        expected = "2, 3, 5, 7, 11, 13, 17, 19, 23, 29\n"
        expect(`ruby #{command} 30`).to eq expected
      end
    end

    context 'argument error' do
      example 'print message as invalid argment' do
        expected = "specify an integer 2 and more to argument.\n"
        expect(`ruby #{command} xxx`).to eq expected
      end
    end
  end
end
