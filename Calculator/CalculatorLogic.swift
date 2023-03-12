//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Matthew Cheung on 12/3/2023.
//  Copyright © 2023 Matthew Cheung. All rights reserved.
//

import Foundation

struct CalculaorLogic {
    private var number: Double?
    
    private var intermediateCalculation : (firsNumber: Double, calMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(_ operatorPressed: String) -> Double? {
        if let n  = number {
           switch operatorPressed {
           case "+/-":
                return n * -1
           case "AC":
                return  0
           case "%":
                return n / 100
           case "=":
                return performTwoNumberCalculation(n)
           default:
                intermediateCalculation = (firsNumber: n, calMethod: operatorPressed)
            }
        }
        return nil
    }
    private mutating func performTwoNumberCalculation(_ secondNumber: Double) -> Double {
        if let firstnumber = intermediateCalculation?.firsNumber, let calMethod = intermediateCalculation?.calMethod {
            switch calMethod {
            case "+":
                return firstnumber + secondNumber
            case "-":
                return firstnumber - secondNumber
            case "×":
                return firstnumber * secondNumber
            case "÷":
                return firstnumber / secondNumber
            default:
                fatalError("The operation passed in does not match any of cases")
            }
        }
        return 0
    }
}
