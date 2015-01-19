require 'spec_helper'

describe Response, '#with_cookie' do
  subject { object.with_cookie(cookie_object) }

  let(:object)            { described_class.build(status, original_headers, body)  }
  let(:status)            { Response::Status::OK }
  let(:cookie_object)     { double('Cookie', to_s: set_cookie_header) }
  let(:set_cookie_header) { double('set_cookie_header') }
  let(:original_headers)  { { 'Foo' => 'Bar' } }

  let(:status)  { double('Status')    }
  let(:body)    { double('Body')      }

  its(:status)  { should be(status) }
  its(:body)    { should be(body)   }
  its(:headers) { should eql('Foo' => 'Bar', 'Set-Cookie' => set_cookie_header) }

  it_should_behave_like 'a functional command method'
end
