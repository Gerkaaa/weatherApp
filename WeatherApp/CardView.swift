//
//  CardView.swift
//  WeatherApp
//
//  Created by Герекмаз Газимагомедова on 16.02.2022.
//

import Foundation
import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 30
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 15.0
        self.layer.shadowColor = UIColor.black.cgColor

    }


}
