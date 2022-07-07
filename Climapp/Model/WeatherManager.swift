//
//  WeatherManager.swift
//  Climapp
//
//  Created by Beavean on 07.07.2022.
//

import Foundation

struct WeatherManager {
    let weatherUrl = 
    
    func fetchWeather(cityName: String) {
        let urlString = weatherUrl + cityName
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:) )
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
