//
//  ViewController.swift
//  Simple-Shopping-Cart
//
//  Created by Md Asif Huda on 4/26/16.
//  Copyright © 2016 Md Asif Huda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageFirstProduct: UIImageView!
    @IBOutlet weak var nameFirstProduct: UILabel!
    @IBOutlet weak var priceFirstProduct: UILabel!
    @IBOutlet weak var quantityFirstProduct: UILabel!
    
    @IBOutlet weak var imageSecondProduct: UIImageView!
    @IBOutlet weak var nameSecondProduct: UILabel!
    @IBOutlet weak var quantitySecondProduct: UILabel!
    @IBOutlet weak var priceSecondProduct: UILabel!
    
    @IBOutlet weak var imageThirdProduct: UIImageView!
    @IBOutlet weak var nameThirdProduct: UILabel!
    @IBOutlet weak var priceThirdProduct: UILabel!
    @IBOutlet weak var quantityThirdProduct: UILabel!
    
    @IBOutlet weak var priceTotal: UILabel!
    
    @IBOutlet weak var orderButton: UIButton!
    
    
    var products : [ProductModel] = Products.dowloandNewProducts()
    var priceTotalCount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderButton.backgroundColor = UIColor.gray
        orderButton.isEnabled = false
        
        imageFirstProduct.layer.cornerRadius = 6.0
        imageFirstProduct.layer.masksToBounds = true
        
        imageSecondProduct.layer.cornerRadius = 6.0
        imageSecondProduct.layer.masksToBounds = true
        
        imageThirdProduct.layer.cornerRadius = 6.0
        imageThirdProduct.layer.masksToBounds = true
        
        self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUI()
    {
        let productFirst = self.products[0]
        nameFirstProduct.text = productFirst.name
        priceFirstProduct.text = "$\(productFirst.price)"
        quantityFirstProduct.text = String(productFirst.quantity)
        
        let productSecond = self.products[1]
        nameSecondProduct.text = productSecond.name
        priceSecondProduct.text = "$\(productSecond.price)"
        quantitySecondProduct.text = String(productSecond.quantity)
        
        let productThird = self.products[2]
        nameThirdProduct.text = productThird.name
        priceThirdProduct.text = "$\(productThird.price)"
        quantityThirdProduct.text = String(productThird.quantity)
        
    }

    var stepperFirstCount = 0.0
    
    @IBAction func stepperFirst(_ sender: UIStepper)
    {
        if (sender.value) <= Double(products[0].quantityMax)
        {
            quantityFirstProduct.text = String(lround(sender.value))
        }
        else
        {
            alertAboutMaxDid(i: 0)
            sender.value = Double(products[0].quantityMax)
        }
        stepperFirstCount = sender.value
        calculatingSum()
        checkValidButtonNext()
    }
    
    var stepperSecondCount = 0.0
    
    @IBAction func stepperSecond(_ sender: UIStepper)
    {
        if (sender.value) <= Double(products[1].quantityMax)
        {
            quantitySecondProduct.text = String(lround(sender.value))
        }
        else
        {
            alertAboutMaxDid(i: 1)
            sender.value = Double(products[1].quantityMax)
        }
        stepperSecondCount = sender.value
        calculatingSum()
        checkValidButtonNext()
    }
    
    
    var stepperThirdCount = 0.0
    
    @IBAction func stepperThird(_ sender: UIStepper)
    {
        if (sender.value) <= Double(products[2].quantityMax)
        {
            quantityThirdProduct.text = String(lround(sender.value))
        }
        else
        {
            alertAboutMaxDid(i: 2)
            sender.value = Double(products[2].quantityMax)
        }
        stepperThirdCount = sender.value
        calculatingSum()
        checkValidButtonNext()
    }
    
    
    
    //сообщение о нехватки товара для заказа
    func alertAboutMaxDid(i : Int)
    {
        let alertController = UIAlertController(title: "Ошибка", message: "Максимально кол-во товара доступно: \(products[i].quantityMax)", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        {
            (action) in self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func calculatingSum() {
        priceTotalCount = stepperFirstCount*products[0].price + stepperSecondCount*products[1].price + stepperThirdCount*products[2].price
        priceTotal.text = "$\(priceTotalCount)"
    }
    
    func checkValidButtonNext() {
        if priceTotalCount == 0
        {
            orderButton.backgroundColor = UIColor.gray
            orderButton.isEnabled = false
        }
        else
        {
            orderButton.isEnabled = true
            orderButton.backgroundColor = UIColor.blue
        }
    }
    
    
    
    @IBAction func orderButtonDidTap(_ sender: Any)
    {
    }
    
    
    //    struct Storyboard {
    //        // identifier of the segue
    //        static let showOrderDetail = "ShowOrderDetail"
    //    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC : CartCheckoutViewController = segue.destination as! CartCheckoutViewController
        destinationVC.finalSum = String(priceTotalCount)
        
    }
    
}

