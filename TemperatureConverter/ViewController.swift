//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Kanyaton Somjit on 2023-03-14.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var celsiusPickerView: UIPickerView!
    
    let userDefaultsRowKey = "defaultsRowKey"
    
    var tempValues = (-100...100).reversed().map{$0}
    let converter = CelsiusConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //samma som "var tempValues = (-100...100).map{$0}"
//        for index in -100...100{
//            tempValues.append(index)
//        }
        
        let defaultRow = initialPickerRow()
        celsiusPickerView.selectRow(defaultRow, inComponent: 0, animated: false)
        
        pickerView(celsiusPickerView, didSelectRow: defaultRow, inComponent: 0)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(tempValues[row]) ºC"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("\(row) : \(tempValues[row])")
        
        let tempC = tempValues[row]
        let tempF = converter.degreeFahrenheit(degreesCelsius: tempC)
        
        temperatureLabel.text = "\(tempF) ºF"
        saveSelected(row: row)
    }

    func saveSelected(row: Int) {
        let defaults = UserDefaults.standard
        
        defaults.set(row, forKey: userDefaultsRowKey)
        defaults.synchronize()
    }

    func initialPickerRow() -> Int {
        let saveRow = UserDefaults.standard.object(forKey: userDefaultsRowKey) as? Int
        
        if let row = saveRow {
            return row
        }else{
            return tempValues.count / 2
        }
        
    }
}

