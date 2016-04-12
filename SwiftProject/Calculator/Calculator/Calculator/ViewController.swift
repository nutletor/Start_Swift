//
//  ViewController.swift
//  Calculator
//
//  Created by HuangFei on 16/4/12.
//  Copyright © 2016年 HuangFei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    
    //输入数字
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit is \(digit)")

        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    //运算
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation {
        case "×":
            performOperation({(op1: Double, op2: Double) -> Double in
                return op2 * op1
                })
        case "÷":
            performOperation({(op1, op2) in return op2 / op1 })
        case "+":
            performOperation({(op1, op2) in op2 + op1 })
        case "−":
            performOperation{ $1 - $0 }
        case "√":
            performSingleOperation{ sqrt($0) }
        default:
            break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            diplayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performSingleOperation(operation: (Double) -> Double) {
        if operandStack.count >= 1 {
            diplayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    var operandStack = Array<Double>()
    //回车
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(diplayValue)
        print("operandStack = \(operandStack)")
    }
    
    var diplayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    


}

