require 'rails_helper'

RSpec.describe "FooApiErrorReportings", type: :request do

    it "invalid Foo reports API error" do
      post foos_path(foo:{id: 1})
      expect(response).to have_http_status(422) or have_http_status(400)
      expect(response.content_type).to eq("application/json")

      #check the payload of the response
      payload=parsed_body
      pp payload
      expect(payload).to have_key("errors")
      expect(payload["errors"]).to have_key("full_messages")
    end
  
end
