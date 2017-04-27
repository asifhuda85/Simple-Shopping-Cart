//
//  CartCheckoutViewController.swift
//  Simple-Shopping-Cart
//
//  Created by Md Asif Huda on 4/26/16.
//  Copyright © 2016 Md Asif Huda. All rights reserved.
//

import UIKit

class CartCheckoutViewController: UIViewController {

    
    var checkShipping : Bool = false
    var expressSelected : Bool = false
    
    @IBOutlet weak var finishingTotal: UILabel!
    
    @IBOutlet weak var expressCountShipping: UILabel!
    
    @IBOutlet weak var freeCounrShipping: UILabel!
    
    @IBAction func standartShippingDidTap(_ sender: Any) {
        checkShipping = true
        expressSelected = false
        finishingTotal.text = "$\(finalSum)"

    }
    
    @IBAction func expressShippingDidTap(_ sender: Any) {
        checkShipping = true
        if expressSelected == false {
            expressSelected = true
            let finalSumDouble = (Double(finalSum)! + 15)
            let totalSum = String(finalSumDouble)
            finishingTotal.text = "$\(totalSum)"
        }
       

    }
    
    var finalSum : String = ""
    
    @IBAction func buttonFinalDidTap(_ sender: Any) {
        
        if checkShipping == true {
            let alertController = UIAlertController(title: "Final confirmation", message: "Are you sure you want to confirm the order?", preferredStyle: UIAlertControllerStyle.alert)
            
            let confrimAction = UIAlertAction(title: "I confirm", style: UIAlertActionStyle.default)
            {
                (action) in self.dismiss(animated: true, completion: nil)
            }
            
            let cancelAction = UIAlertAction(title: "Back to top", style: UIAlertActionStyle.default)
            {
                (action) in self.dismiss(animated: true, completion: nil)
            }
            
            alertController.addAction(confrimAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            let alertController = UIAlertController(title: "No delivery type selected", message: "Please choose one of the delivery options", preferredStyle: UIAlertControllerStyle.alert)
            
            let confrimAction = UIAlertAction(title: "Ок", style: UIAlertActionStyle.default)
            {
                (action) in self.dismiss(animated: true, completion: nil)
            }
            
            alertController.addAction(confrimAction)
            
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
    }
    
    
    func updateUI(){
        
        finishingTotal.text = "$\(finalSum)"
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
