# config/initializers/time_formats.rb
Time::DATE_FORMATS[:day_month_and_year] = "%b %d, %Y"
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }