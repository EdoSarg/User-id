//
//  ColorViewController.swift
//  ApiData-Cell
//
//  Created by Edgar Sargsyan on 14.07.23.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var stringLabel: UILabel!
    
    var tLable = " "
    var testResult = false
   var cod = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(testResult)
        
        self.view.backgroundColor = testResult ? UIColor.green : UIColor.red
        if view.backgroundColor == UIColor.red {
            errorLabel.text = "Error"
            stringLabel.text = tLable
        }else{
            errorLabel.text = "Success"
            stringLabel.text = tLable
        }
    }
}
