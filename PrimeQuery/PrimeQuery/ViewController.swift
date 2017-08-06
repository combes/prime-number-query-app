//
//  ViewController.swift
//  PrimeQuery
//
//  Created by Christopher Combes on 8/6/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var indexField: UITextField!
    @IBOutlet weak var primeField: UILabel!
    
    var primeTester = PrimeTester()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: UIButton) {
        if let index = indexField.text {
            
            // Hide keyboard
            indexField.resignFirstResponder()
            
            if let indexValue = Int(index) {
                if indexValue > PrimeTester.maxIndex {
                    // Alert user
                    let alertController = UIAlertController(title: "Error", message: "Max prime index is \(PrimeTester.maxIndex)", preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                        (result : UIAlertAction) -> Void in
                        self.primeField.text = "?"
                        self.indexField.text = ""
                    }
                    
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    // Calculate this prime
                    let prime = primeTester.primeNumberAt(index: indexValue)
                    primeField.text = String(prime)
                }
            }
            
        }
    }

    // TODO: Shift stack view upward when keyboard becomes visible to accomodate smaller screen sizes.
    
    // UITextFieldDelegate
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     
        // Limit text field to numerals only
        if string.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
            return true
        } else if string == "" {
            // Allow deletion
            return true
        }
        
        return false
    }

}

