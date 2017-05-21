require 'rails_helper'
require 'practical_work_1.rb'

describe Image do
  let(:response) { double('faraday_response', status: status, headers: headers, body: body) }
  before do
    allow(Faraday).to receive(:get).with(anything).and_return(response)
  end

  describe '#download' do
    context 'failed status downloads' do
      let(:status) { 500 }
      let(:headers) { {} }
      let(:body) { {} }
      it 'should raise error if url is broken' do
        expect { Image.download('') }.to raise_error(ArgumentError)
      end
    end

    context 'wrong content type' do
      let(:status) { 200 }
      let(:headers) { { 'content-type' => 'plain/text' } }
      let(:body) { {} }
      it 'should raise error if content is not an image' do
        expect { Image.download('') }.to raise_error(TypeError)
      end
    end

    context 'successful' do
      let(:status) { 200 }
      let(:headers) { { 'content-type' => 'image/jpeg' } }
      let(:body) { 'the content for the file' }
      it 'should download file' do
        expect(Image.download('https://www.hello.com/img_/hello_logo_hero.png')).to be_truthy
      end
    end
  end
end
