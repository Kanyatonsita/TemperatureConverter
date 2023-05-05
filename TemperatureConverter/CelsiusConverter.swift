//
//  CelsiusConverter.swift
//  TemperatureConverter
//
//  Created by Kanyaton Somjit on 2023-03-14.
//

import Foundation

class CelsiusConverter {
    
    
    func degreeFahrenheit(degreesCelsius: Int) -> Int {
        
        let tempF = 1.8 * Double(degreesCelsius) + 32
        
        return Int(round (tempF))
    }
}

