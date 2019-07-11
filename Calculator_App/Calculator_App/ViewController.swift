//
//  ViewController.swift
//  Calculator_App
//
//  Created by Stewart, Christopher Michael on 6/21/19.
//  Copyright © 2019 Christopher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //allows you to minimize keyboard by tapping outside of the textField
        self.firstNumber.resignFirstResponder()
        self.view.endEditing(true)
    }//end touchesBegan
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //if textField selected = firstNumber then resignFirstResponder and return value of textFieldShouldReturn as true (minimizes the keyboard)
        if textField == self.firstNumber{
            self.firstNumber.resignFirstResponder()
        }
        return true
    }//end textFieldShouldReturn
    
    
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var typeMath: UISegmentedControl!
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var listOperations: UITextView!
    var fullText = 0
    
    //Check which button was pressed via currentTitle and do actions accordingly
    @IBAction func doMath(_ sender: UIButton) {
        let whichButtonPressed = (sender as! UIButton).currentTitle!
        switch whichButtonPressed {
            case "+":
                //if type math is int do int, else do double for each
                if typeMath.selectedSegmentIndex == 0{
                    result.text = String(Int(add(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!)))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "+" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"
                    
                    fullText+=1;
                }else if typeMath.selectedSegmentIndex == 1{
                    result.text = String(add(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "+" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"
                    
                    fullText+=1;
                }
                result.isHidden = false
            case "-":
                if typeMath.selectedSegmentIndex == 0{
                    result.text = String(Int(subtract(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!)))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "-" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"
                    
                    fullText+=1;
                }else if typeMath.selectedSegmentIndex == 1{
                    result.text = String(subtract(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "-" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"
                    
                    fullText+=1;
                }
                result.isHidden = false
            case "x":
                if typeMath.selectedSegmentIndex == 0{
                    result.text = String(Int(multiply(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!)))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "*" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"
                    
                    fullText+=1;
                }else if typeMath.selectedSegmentIndex == 1{
                    result.text = String(multiply(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "*" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"

                    fullText+=1;
                }
                result.isHidden = false
            case "÷":
                if typeMath.selectedSegmentIndex == 0{
                    result.text = String(Int(divide(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!)))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "÷" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"

                    fullText+=1;
                }else if typeMath.selectedSegmentIndex == 1{
                    result.text = String(divide(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "÷" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"

                    fullText+=1;
                }
                result.isHidden = false
            case "%":
                if typeMath.selectedSegmentIndex == 0{
                    result.text = String(Int(modulo(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!)))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "%" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"

                    fullText+=1;
                }else if typeMath.selectedSegmentIndex == 1{
                    result.text = String(modulo(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "%" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"

                    fullText+=1;
                }
                result.isHidden = false
            case "^":
                if typeMath.selectedSegmentIndex == 0{
                    result.text = String(Int(power(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!)))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "^" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"

                    fullText+=1;
                }else if typeMath.selectedSegmentIndex == 1{
                    result.text = String(power(first: Double(firstNumber.text!)!, second: Double(secondNumber.text!)!))
                    
                    listOperations.text = listOperations.text + String(firstNumber.text!) + "^" + String(secondNumber.text!) + "=" + String(result.text!) + "\n"

                    fullText+=1;
                }
                result.isHidden = false
            default: break
        }//end switch
        
        if fullText == 6{
            listOperations.text = ""
            fullText = 0
        }
        
    }//end doMath
    
    //doMath functions
    func add(first: Double, second: Double) -> Double {
        return first + second;
    }//end
    func subtract(first: Double, second: Double) -> Double {
        return first - second;
    }//end
    func multiply(first: Double, second: Double) -> Double {
        return first * second;
    }//end
    func divide(first: Double, second: Double) -> Double {
        return first / second;
    }//end
    func modulo(first: Double, second: Double) -> Double {
        return first.truncatingRemainder(dividingBy: second)
    }//end
    func power(first: Double, second: Double) -> Double {
        return pow(first, second);
    }//end
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.isHidden = true
        self.firstNumber.delegate = self   //must include UITextFieldDelegate in class declaration
        firstNumber.keyboardType = .numberPad   //show numberpad only
        secondNumber.keyboardType = .numberPad  //show numberpad only
        firstNumber.becomeFirstResponder() //sets the text field as selected on application launch
                
    }//end viewDidLoad
    
}//end

