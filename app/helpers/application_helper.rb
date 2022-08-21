module ApplicationHelper
    def format_seconds(seconds)
        seconds>3600 ? format = "%H:%M:%S" : format = "%M:%S" ;
        Time.at(seconds).utc.strftime(format)
    end
end
