//
//  Calculator.swift
//  AutoLayout
//
//  Created by Tiến on 2/22/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation

enum Operation{
    case add, subtract, multiply, divide
}

struct Calculator {
    
    var firstNumber:Double? = nil
    var secondeNumber:Double? = nil
    var result:Double?{
        guard let a = firstNumber, let b = secondeNumber else{
            return .none
        }
        switch operation {
        case .add:
            return a+b
        case .subtract:
            return a-b
        case .multiply:
            return a*b
        case .divide:
            return a/b
        case .none:
            return 0
        }
    }
    var operation: Operation! = nil
    var check: Bool = true
    
    mutating func reset(){
        firstNumber = nil
        secondeNumber = nil
        operation = nil
        check = true
    }
    
}

