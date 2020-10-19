import requests, json
import serial
import time

def getCityNameFromUserInterface():
    serverURL = "http://192.168.43.109:3000/test_get/weather.json"
    responseFromServer = requests.get(serverURL, verify=False)
    responseObject = responseFromServer.json()
    weatherObject = responseObject["weather"]
    cityObject = weatherObject["city"]
    return cityObject

def getWeatherDetailsFromWebAsObject():
    weatherApiKey = "f65d02a4bdad0702b4c84d294712d3a7"
    weatherURL = "http://api.openweathermap.org/data/2.5/weather?"
    city_name = getCityNameFromUserInterface()
    complete_url = weatherURL + "appid=" + weatherApiKey + "&q=" + city_name
    response = requests.get(complete_url)
    x = response.json()
    #404 means that city is not found
    if x["cod"] != "404":
        y = x["main"]
        current_temperature = y["temp"]  #that's in kelvin
        current_pressure = y["pressure"]
        current_humidiy = y["humidity"]
        z = x["weather"]
        weather_description = z[0]["description"]
        print(" Temperature (in kelvin unit) = " +
                        str(current_temperature) +
              "\n atmospheric pressure (in hPa unit) = " +
                        str(current_pressure) +
              "\n humidity (in percentage) = " +
                        str(current_humidiy) +
              "\n description = " +
                        str(weather_description))
    else:
        print(" City Not Found ")
    return y

def getOutsideTemperature():
    y = getWeatherDetailsFromWebAsObject()
    return y["temp"]

def sendToArduino(sendString):
    ser = serial.Serial('/dev/ttyACM0',9600)
    ser.flushInput()
    s= ser.readline()
    s= s.strip()
    print (s.decode("utf-8"))
    if (s.decode("utf-8") == "<Arduino is ready>"):
        print("sending")
        ans = sendString
        ans = ans.encode("utf-8")
        ser.write(ans)


def main():
    outsideTemperature = getOutsideTemperature()
    #sendToArduino(outsideTemperature)
    print(outsideTemperature)

main()