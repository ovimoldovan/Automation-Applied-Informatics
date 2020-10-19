import requests, json
  

serverUrl = "https://localhost:5001/weather.json"
responseFromServer = requests.get(serverUrl, verify=False)
responseObject = responseFromServer.json()
weatherObject = responseObject["weather"]
cityObject = weatherObject["city"]

print(cityObject)
