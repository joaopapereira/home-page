require 'rails_helper'

RSpec.describe Visitor, :type => :model do
  describe "Set IP" do
      before do 
          @github_info = GeoIP.new('GeoLiteCity.dat').city("www.github.com")
      end
      it "Change IP" do
          v = Visitor.new
          v.set_ip_address "www.github.com"
          expect(v.ip).to eq "www.github.com"
          expect(v.country).to eq @github_info.country_name
          expect(v.small_country).to eq @github_info.country_code3
          expect(v.city).to eq @github_info.city_name
      end
  end
end
