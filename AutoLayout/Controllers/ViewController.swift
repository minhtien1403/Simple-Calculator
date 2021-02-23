//
//  ViewController.swift
//  AutoLayout
//
//  Created by Tiến on 2/19/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet private weak var resultLabel: UILabel!
    private var calc = Calculator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberPress(_ sender: UIButton) {
        if (sender.tag == 16){ 
            if let currentNumber = resultLabel.text{
                 resultLabel.text = "\(currentNumber)."
            }
        }
        else{
            let tag = sender.tag - 1
            if calc.check == true{
                resultLabel.text = "\(tag)"
                calc.check = false
            }
            else if let currentnumber = resultLabel.text{
                resultLabel.text = "\(currentnumber)\(tag)"
            }
        }
    }
    
    @IBAction func operatorPress(_ sender: UIButton) {
        calc.check = true
        
        if calc.firstNumber != nil && calc.secondeNumber != nil{
            if let res = calc.result{
                resultLabel.text = "\(res)"
                calc.firstNumber = res
                calc.secondeNumber = nil
            }
            
        }
        if calc.firstNumber == nil{
            calc.firstNumber = Double(resultLabel.text!)
        }
        else{
            calc.secondeNumber = Double(resultLabel.text!)
            resultLabel.text = "\(calc.result!)"
            calc.firstNumber = calc.result
            calc.secondeNumber = nil
        }


        switch sender.tag{
        case 11:
            calc.operation = .add
        case 12:
            calc.operation = .subtract
        case 13:
            calc.operation = .multiply
        case 14:
            calc.operation = .divide
        default:
            return
        }
    }
    
    @IBAction func equalPress(_ sender: Any) {

        guard let text = resultLabel.text, let value = Double(text) else{
            return
        }
        calc.secondeNumber = value
        guard let res = calc.result else {
            return
        }
        resultLabel.text = "\(res)"
        calc.reset()
        
    }
    
    @IBAction func clearAll(_ sender: Any) {
        resultLabel.text = "0"
        calc.reset()
    }
}

