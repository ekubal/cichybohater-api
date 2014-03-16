# -*- encoding : utf-8 -*-
class ActiveSupport::TimeWithZone
  #Changing the as_json method to remove the milliseconds from TimeWithZone to_json result (just like in Rails 3)
    def as_json(options = {})
      if ActiveSupport::JSON::Encoding.use_standard_json_time_format
        xmlschema
      else
        %(#{time.strftime("%Y/%m/%d %H:%M:%S")})
      end
    end
end
ActiveSupport::JSON::Encoding.use_standard_json_time_format= false
