class Index < ActiveRecord::Base
  
  def self.getWeather
    weather = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=San%20Francisco,usa')
    main = weather['weather'][0]['main']
    temp = weather['main']['temp']
    tempF = ((9/5)*(temp-273)+32).round(1)
    windSpeed = weather['wind']['speed']
    windDegrees = weather['wind']['deg']
    windDF = ((9/5)*(windDegrees-273)+32).round(1)
    clouds = weather['clouds']['all']
    weatherHash = {main: main, temp: tempF, windSpeed: windSpeed, windDegrees: windDF, clouds: clouds}
    return weatherHash
  end

end
