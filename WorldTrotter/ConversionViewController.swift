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
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    @IBOutlet var textField: UITextField!
    
    
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
//        celsiusLabel.text = textField.text
//        if let text = textField.text, !text.isEmpty {
//            celsiusLabel.text = text
//        } else {
//            celsiusLabel.text = "???"
//        }
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = "\(celsiusLabel)"
        } else {
            celsiusLabel.text = "???"
        }
    }
    
}
