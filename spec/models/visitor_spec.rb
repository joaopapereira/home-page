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
  describe "Find today by ip address" do
    before do
      v1 = Visitor.new
      v1.set_ip_address '1.2.3.4'
      v1.created_at = DateTime.now
      v1.save
      v1 = Visitor.new
      v1.set_ip_address '1.2.3.5'
      v1.created_at = DateTime.now - 1.day
      v1.save
    end
    it "Find today's IP" do
      v1 = Visitor.find_today_by_ip_address '1.2.3.4'
      expect(v1.length).to eq 1
      expect(v1[0].ip).to eq "1.2.3.4"
    end
    it "Not Find yesterday's IP" do
      v1 = Visitor.find_today_by_ip_address '1.2.3.5'
      expect(v1.length).to eq 0
    end
    it "None existent IP" do
      v1 = Visitor.find_today_by_ip_address '1.2.3.2'
      expect(v1.length).to eq 0
    end
  end
end
