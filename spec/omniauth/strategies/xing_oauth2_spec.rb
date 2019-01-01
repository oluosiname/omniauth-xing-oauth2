require 'spec_helper'
require 'omniauth/xing_oauth2'

RSpec.describe OmniAuth::Strategies::XingOauth2 do
  subject { OmniAuth::Strategies::XingOauth2.new(nil) }

  it "has a version number" do
    expect(OmniAuth::XingOauth2::VERSION).not_to be nil
  end

  it 'should add a camelization for itself' do
    expect(OmniAuth::Utils.camelize('xing')).to eq('Xing')
  end

  describe '#client' do
    it 'has correct Xing site' do
      expect(subject.client.site).to eq('https://api.xing.com')
    end

    it 'has correct authorize url' do
      expect(subject.client.options[:authorize_url]).to eq('/auth/oauth2/authorize')
    end

    it 'has correct token url' do
      expect(subject.client.options[:token_url]).to eq('/auth/oauth2/token')
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      expect(subject.callback_path).to eq('/auth/xing/callback')
    end
  end

  describe '#uid' do
    before :each do
      allow(subject).to receive(:raw_info) { { 'id' => 'uid' } }
    end

    it 'returns the id from raw_info' do
      expect(subject.uid).to eq('uid')
    end
  end

  describe '#info' do
    before :each do
      allow(subject).to receive(:raw_info) { {} }
    end

    context 'and therefore has all the necessary fields' do
      it { expect(subject.info).to have_key :email }
      it { expect(subject.info).to have_key :first_name }
      it { expect(subject.info).to have_key :last_name }
      it { expect(subject.info).to have_key :image }
    end
  end

  describe '#extra' do
    before :each do
      allow(subject).to receive(:raw_info).and_return(foo: 'bar')
    end

    it { expect(subject.extra[:raw_info]).to eq(foo: 'bar') }
  end

  describe '#raw_info' do
    before :each do
      access_token = double('access token')
      response = double('response', body: { 'users' => [{ foo: 'bar' }] }.to_json )
      expect(access_token).to receive(:get).with('/v1/users/me').and_return(response)

      allow(subject).to receive(:option_fields) { %w(baz qux) }
      allow(subject).to receive(:access_token) { access_token }
    end

    it 'returns parsed response from access token' do
      expect(subject.raw_info).to eq('foo' => 'bar')
    end
  end
end
