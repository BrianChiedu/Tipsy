//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Brian Chukwuisiocha on 5/22/23.
//

import UIKit

struct CalculatorBrain{
    
    var bill:Bill?
    
    mutating func calculateFinalBill(totalBillText: String, tip: Int, split: String){
        let totalBillNum = Float(totalBillText) ?? 0.0
        let actualTip = Float(tip)/100
        let splitDat = Float(split) ?? 2.0
        
        let billValue = (totalBillNum + (actualTip * totalBillNum))/splitDat
        
        
        bill = Bill(billValue: billValue, advice: "Split between \(split) people, with \(tip)% tip.")
    }
    
    func getBill() -> String{
        return String(format: "%.2f", bill?.billValue ?? 0.0)
    }
    
    func getAdviceText()-> String{
        return bill?.advice ?? "No advice"
    }
}
