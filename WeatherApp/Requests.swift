//
//  Requests.swift
//  WeatherApp
//
//  Created by Герекмаз Газимагомедова on 19.02.2022.
//

import Foundation
import Alamofire

let API_KEY = "4c3df58d1ca465aac2f299e0c55b85c0"
let DEFAULT_CITY = "Moscow"

func buildApiUrl(city: String) -> String {
    return ("https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)")
}

func getCityWeather() -> DataRequest {
    return AF.request(buildApiUrl(city: "Moscow"), method: .get).response {
        (responseData) in
        guard let data = responseData.data else {return}
        do {
            let product = try JSONDecoder().decode(Product.self, from: data)
            return product
        } catch {
            print("Error: \(error)")
        }
    }
}
