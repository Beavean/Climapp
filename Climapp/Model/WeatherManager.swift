//
//  WeatherManager.swift
//  Climapp
//
//  Created by Beavean on 07.07.2022.
//

import Foundation

struct WeatherManager {
    let weatherUrl = ""
    
    func fetchWeather(cityName: String) {
        let urlString = weatherUrl + cityName
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                    
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
           let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
        } catch {
            print(error)
        }
    }
}
