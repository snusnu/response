require 'spec_helper'

describe Response::Redirect::Found, '#build' do
  
  subject { object.build(location) }

  let(:object) { described_class }

  let(:location) { mock('Location', :to_s => 'THE-LOCATION') }

  its(:status)  { should be(302) }
  its(:headers) { should eql('Location' => location, 'Content-Type' => 'text/plain; charset=UTF-8') }
  its(:body)    { should eql('You are beeing redirected to: THE-LOCATION') }
end

describe Response::Redirect::Permanent, '#build' do
  
  subject { object.build(location) }

  let(:object) { described_class }

  let(:location) { mock('Location', :to_s => 'THE-LOCATION') }

  its(:status)  { should be(301) }
  its(:headers) { should eql('Location' => location, 'Content-Type' => 'text/plain; charset=UTF-8') }
  its(:body)    { should eql('You are beeing redirected to: THE-LOCATION') }
end

