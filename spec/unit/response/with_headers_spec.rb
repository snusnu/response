require 'spec_helper'

describe Response, '#with_headers' do
  subject { object.with_status(status).with_body(body).with_headers(headers) }

  let(:object)  { described_class.build }

  let(:status)  { Response::Status::OK }
  let(:body)    { double('Body')         }
  let(:headers) { double('Headers')      }

  its(:status)  { should be(status)    }
  its(:body)    { should be(body)      }
  its(:headers) { should be(headers)   }

  it_should_behave_like 'a functional command method'
end
