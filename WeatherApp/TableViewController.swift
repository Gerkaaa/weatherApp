//
//  TableViewController.swift
//  WeatherApp
//
//  Created by Герекмаз Газимагомедова on 27.02.2022.
//

import UIKit
import IIDadata

class TableViewController: UITableViewController {
    var citiesList = [AddressSuggestions]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
//    override func viewWillLayoutSubviews() {
//        preferredContentSize = CGSize(width: 250, height: 250)
//    }

    // MARK: - Table view data source
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.citiesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let textData = citiesList[indexPath.row]
        cell.textLabel?.text = textData.value

        return cell
    }

    func getSuggestions(city: String) {
        let DADATA_API_KEY = "8e086894d1fb64d85c451ebb3e5487401cf3e3f1"

        try! DadataSuggestions
            .shared(
                apiKey: DADATA_API_KEY
        ).suggestAddress(
                city,
                completion: { responseData in
                    switch responseData {
                    case .success(let response):
                        self.citiesList = response.suggestions ?? []
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    case .failure(let error):
                        print(error)
                    }
            }
        )

    }
}
