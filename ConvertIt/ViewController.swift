//
//  ViewController.swift
//  ConvertIt
//
//  Created by Christopher Donnelly on 2/21/19.
//  Copyright © 2019 Chris Donnelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var fromUnitsLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var formulaPicker: UIPickerView!
    
    var formulaArray = ["Miles to Kilometers",
                        "Kilometers to Miles",
                        "Feet to Meters",
                        "Yards to Meters",
                        "Meters to Feet",
                        "Meters to Yeards"]
    var fromUnits = ""
    var toUnits = ""
    var conversionString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formulaPicker.delegate = self
        formulaPicker.dataSource = self
    }
    
    func calculateConversion() {
        var outputValue = 0.0
        if let inputValue = Double(userInput.text!) {
            
            switch conversionString {
            case "Miles to Kilometers":
                outputValue = inputValue / 0.62137
            case "Kilometers to Miles":
                outputValue = inputValue * 0.62137
            case "Feet to Meters":
                outputValue = inputValue / 3.2808
            case "Yards to Meters":
                outputValue = inputValue / 1.0936
            case "Meters to Feet":
                outputValue = inputValue * 3.2808
            case "Meters to Yeards":
                outputValue = inputValue * 1.0936
            default:
                print("show alert for bad conversion string")
            }
            resultsLabel.text = "\(inputValue) \(fromUnits) = \(outputValue) \(toUnits)"
        } else {
            print("value entered was not a number")
        }
        
        
    }
    
    
    @IBAction func convertButtonPressed(_ sender: UIButton) {
    }
    

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return formulaArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formulaArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        conversionString = formulaArray[row]
        let unitsArray = formulaArray[row].components(separatedBy: " to ")
        fromUnits = unitsArray[0]
        toUnits = unitsArray[1]
        fromUnitsLabel.text = fromUnits
        calculateConversion()
    }
    
    
}
