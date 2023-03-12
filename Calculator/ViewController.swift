//
//  ViewController.swift
//  Calculator
//
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    private var calculatorLogic = CalculaorLogic()
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot covert display label tesxt to double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }

    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        if let calMethod = sender.currentTitle{
            calculatorLogic.setNumber(displayValue)
            if  let result = calculatorLogic.calculate(calMethod)  {
                displayValue = result
            }
          
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt{
                        return
                    }
                }
                displayLabel.text! = displayLabel.text! + numValue
            }
        }
    }
    
}

