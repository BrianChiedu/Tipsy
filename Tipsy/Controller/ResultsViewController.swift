//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Brian Chukwuisiocha on 5/22/23.
// 
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bill: String?
    var advice: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = bill
        settingsLabel.text = advice

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
