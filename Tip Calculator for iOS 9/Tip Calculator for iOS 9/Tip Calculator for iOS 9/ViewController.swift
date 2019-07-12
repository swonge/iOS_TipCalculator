//
//  ViewController.swift
//  Tip Calculator for iOS 9
//
//  Created by Steve Wong on 18/6/2019.
//  Copyright © 2019 Steve Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtMealCost: UITextField!
    @IBOutlet weak var txtTipPercentage: UITextField!
    
    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblTipTotal: UILabel!
    
    // var mealCost : Float = 0.0
    // var tipPercentage : Float = 0.0
    var mealCost = ""
    var tipPercentage = ""
    
    var totalTip : Float = 0.0
    var totalMealCost : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCalculateACTION(_ sender: UIButton) {
        calculatTip()
    }
    
    @IBAction func btnClearACTION(_ sender: UIButton) {
        clear()
    }
    
    func calculatTip() {
        // Taking in the user input text
        mealCost = txtMealCost.text!
        tipPercentage = txtTipPercentage.text!
        
        // convert text (string) into float
        // use "let" instead of var
        let fMealCost = Float(mealCost)
        let fTipPercentage = Float(tipPercentage)
        
        
        totalTip = fMealCost! * (fTipPercentage! / 100)
        totalMealCost = fMealCost! + totalTip
        
        printTip()
    }
    
    func printTip() {
        let formatTip = String(format: "0.2f", totalTip)
        let formatTotal = String(format: "%0.2f", totalMealCost)
        
        lblTip.text = "Tip: $\(totalTip)"
        lblTipTotal.text = "$\(totalMealCost)"
    }
    
    func clear() {
        txtMealCost.text = ""
        txtTipPercentage.text = ""
        
        lblTip.text = "Tip: $0.00"
        lblTipTotal.text = "0.00"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboards()
    }
    
    func hideKeyboards() {
        txtMealCost.resignFirstResponder()
        txtTipPercentage.resignFirstResponder()
    }
}

