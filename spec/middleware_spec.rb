require_relative '../lib/delayed_redirect/middleware'

describe DelayedRedirect::Middleware do

  let(:app) { proc{[200,{},['Hello, world.']]} }
  let(:stack) { DelayedRedirect::Middleware.new(app) }
  let(:request) { Rack::MockRequest.new(stack) }
  let(:response) { request.get('/') }

  context 'with no delayed_redirect_to calls made' do

    before do
      expect(DelayedRedirect::Middleware).to_not receive(:delayed_redirect_to)
    end

    it { expect(response.status).to eq(200) }
    it { expect(response.headers.keys).to_not include('location') }
  end

  context 'a delayed_redirect_to call made' do

    before do
      DelayedRedirect::Middleware.delayed_redirect_to '/alternate', status: 303
    end

    it { expect(response.status).to eq(303) }
    it { expect(response.headers).to include('Location' => '/alternate') }
  end

  context 'a dleayed_redirect_to call made, the app executes, and then no call is made' do

    before do
      DelayedRedirect::Middleware.delayed_redirect_to '/alternate', status: 303
      request.get('/')
      request.get('/')
    end

    it { expect(response.status).to eq(200) }
    it { expect(response.headers.keys).to_not include('location') }

  end

end


