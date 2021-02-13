//
//  ResultViewController.swift
//  Acceleromator
//
//  Created by Ririko Nagaishi on 2021/02/13.
//

import UIKit

class ResultViewController: UIViewController {

    var accelerationX: Double!
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result: Double = fabs(accelerationX*100)
        label.text = String(format: "%.1f°", result)

    }
    

   
}
