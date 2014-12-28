require 'geoip'
class Visitor < ActiveRecord::Base
    def set_ip_address ip_add
        c = GeoIP.new('GeoLiteCity.dat').city(ip_add)
        self.ip = ip_add
        self.country = c.country_name
        self.small_country = c.country_code3
        self.city = c.city_name
    end
end
