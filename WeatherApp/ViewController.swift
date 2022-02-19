//
//  ViewController.swift
//  WeatherApp
//
//  Created by Герекмаз Газимагомедова on 16.02.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityTemp: UILabel!
    @IBOutlet weak var tempIcon: UIImageView!
    @IBOutlet weak var cityWeather: UILabel!
    @IBOutlet weak var cityNameField: UITextField!
    
    let API_KEY = "4c3df58d1ca465aac2f299e0c55b85c0"
    let DEFAULT_CITY = "Moscow"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCityWeather(city: DEFAULT_CITY)
    }

    @IBAction func searchBtn(_ sender: Any) {
        self.getCityWeather(city: self.cityNameField.text!)
        self.cityNameField.text = ""
    }
    
    func getCityWeather(city: String) {
        AF.request(self.buildApiUrl(city: city), method: .get).response { [self]
            (responseData) in
            guard let data = responseData.data else {return}
            do {
                let product = try JSONDecoder().decode(Product.self, from: data)
                self.cityName.text = product.name
                self.cityTemp.text = "\(String(describing: Int(((product.main?.temp)! - 273.0)))) °C"
                
                guard let img = URL(string: "https://openweathermap.org/img/wn/\(product.weather?.first?.icon ?? "04n")@2x.png") else { return }
                self.tempIcon.image = UIImage(data: try! Data(contentsOf: img))
                self.cityWeather.text = product.weather?.first?.main ?? ""
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func buildApiUrl(city: String) -> String {
        return ("https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(self.API_KEY)")
    }
    
}
