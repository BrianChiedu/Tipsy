//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let btnSelected = sender.currentTitle!
        if(btnSelected == "0%"){
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if(btnSelected == "10%"){
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else if(btnSelected == "20%"){
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalBill = billTextField.text ?? "0"
        let split = splitNumberLabel.text ?? "2"
        
        //Calculate the bill
        if(zeroPctButton.isSelected){
            calculatorBrain.calculateFinalBill(totalBillText: totalBill, tip: 0, split: split)
        } else if(tenPctButton.isSelected){
            calculatorBrain.calculateFinalBill(totalBillText: totalBill, tip: 10, split: split)
        } else{
            calculatorBrain.calculateFinalBill(totalBillText: totalBill, tip: 20, split: split)

        }
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // code for when we have multiple segues, we need to make sure we are going in the right one
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultsViewController
            //pass the values through the segue to be displayed on the results screen
            destinationVC.bill = calculatorBrain.getBill()
            destinationVC.advice = calculatorBrain.getAdviceText()
        }
    }
    


}

