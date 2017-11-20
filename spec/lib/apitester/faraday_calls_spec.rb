require 'spec_helper'

RSpec.describe Apitester::FaradayCalls do
  before do
    stub_request(:any, /www.example.com/)
  end

  let(:obj) { Apitester::FaradayCalls.new(base_url: 'http://www.example.com') }

  describe '#get' do
    context 'when have only path' do
      it 'makes a simple get call' do
        obj.get '/asdasd'
        expect(a_request(:get, "www.example.com/asdasd").with(body: {})).to have_been_made.once
      end
    end

    context 'when request has body' do
      it 'makes calls with body specified in the body params' do
        obj.get '/asdasd', { jane: 'doe' }
        expect(a_request(:get, "www.example.com/asdasd?jane=doe")).to have_been_made.once
      end
    end

    context 'when request also has headers' do
      it 'makes calls with headers specified' do
        obj.get '/asdasd', { }, { a: '1' }
        expect(a_request(:get, "www.example.com/asdasd").with({headers: {'A' => '1'}})).to have_been_made.once
      end
    end

    context 'when request has body and headers' do
      it 'makes calls with body specified in the body params' do
        obj.get '/asdasd', { jane: 'doe' }, { a: '1' }
        expect(a_request(:get, "www.example.com/asdasd?jane=doe").with({headers: {'A' => '1'}})).to have_been_made.once
      end
    end

    context 'when request has a different URL than the URL specified' do
      before { stub_request(:any, /www.example.de/) }

      it 'makes calls with body specified in the body params' do
        obj.get '/asdasd', { jane: 'doe' } do |k, c|
          c.url_prefix = 'http://www.example.de'
          k.headers.merge!({ a: '1' })
        end
        expect(a_request(:get, "www.example.de/asdasd?jane=doe").with({headers: {'A' => '1'}})).to have_been_made.once
      end
    end
  end
end
