//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Luca Stanger on 09.03.20.
//  Copyright © 2020 Luca Stanger. All rights reserved.
//

//import Foundation

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
//        celsiusLabel.text = textField.text
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
}
