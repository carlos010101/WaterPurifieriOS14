//
//  SelectProductVC.swift
//  Water Purifier
//
//  Created by Carlos Hernández
//

import UIKit

class SelectProductVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var selectProductLabel: UILabel!
    @IBOutlet weak var garrafonCompletoButton: UIButton!
    @IBOutlet weak var medioGarrafonButton: UIButton!
    @IBOutlet weak var botellaButton: UIButton!
    
    
    //MARK: - Variables
    
    private var product : Product?
    
    //MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.title = "Purificadora"
        textAnimated()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        roundButtons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let paymentVC = segue.destination as? PaymentVC {
            
            paymentVC.initProduct(with: product)
            
        }
    }
    
    //MARK: - Actions
    
    @IBAction func garrafonCompletoButtonWasPressed(_ sender: UIButton) {

        var garrafonProduct = Product()
        garrafonProduct.productCost = 12.00
        garrafonProduct.productImage = UIImage(named: "garrafon-completo")!
        garrafonProduct.productName = "Garrafón completo"
        self.product = garrafonProduct
        sender.shine()
        
    }
    
    @IBAction func medioGarrafonButtonWasPressed(_ sender: UIButton) {
        
        var medioProduct = Product()
        medioProduct.productCost = 6.00
        medioProduct.productImage = UIImage(named: "medio-garrafon")!
        medioProduct.productName = "Medio garrafón"
        self.product = medioProduct
        sender.shine()
        
    }
    
    @IBAction func botellaButtonWasPressed(_ sender: UIButton) {
        
        var botellaProduct = Product()
        botellaProduct.productName = "Botella"
        botellaProduct.productImage = UIImage(named: "botella")!
        botellaProduct.productCost = 3.00
        self.product = botellaProduct
        sender.shine()
        
    }
    
    
    //MARK: - Functions
    
    private func roundButtons(){
        
        garrafonCompletoButton.round()
        medioGarrafonButton.round()
        botellaButton.round()
        
    }
    
    private func textAnimated() {
        
        selectProductLabel.text = ""
        var charIndex = 0.0
        let titleText = "Seleccione un producto 💧"
        for letter in titleText {
            
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                
                self.selectProductLabel.text?.append(letter)
            }
            
            charIndex += 1
            
        }
        
    }
    
}

