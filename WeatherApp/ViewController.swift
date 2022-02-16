//
//  ViewController.swift
//  WeatherApp
//
//  Created by Герекмаз Газимагомедова on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityTemp: UILabel!
    @IBOutlet weak var tempIcon: UIImageView!
    @IBOutlet weak var cityWeather: UILabel!
    @IBOutlet weak var cityNameField: UITextField!
    
    let API_KEY = "4c3df58d1ca465aac2f299e0c55b85c0"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchBtn(_ sender: Any) {
       
    }
    
    func buildApiUrl(city: String) -> String {
        return ("https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(self.API_KEY)")
    }
    
}


