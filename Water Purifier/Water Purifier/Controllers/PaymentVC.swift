//
//  PaymentVC.swift
//  Water Purifier
//
//  Created by mac on 08/01/21.
//

import UIKit

class PaymentVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var creditsLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    //MARK: - Variables
    
    private var product : Product?
    private var productManager = ProductManager()
    
    //MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addColorToNextButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViewWithProductInfo(product: product)
        navigationItem.backBarButtonItem?.title = "Regresar"
    }
    
    
    //MARK: - Actions
    
    @IBAction func nextButtonWasPressed(_ sender: UIButton) {
        
        print("Pago completado")
    }
    
    @IBAction func tenPesosCoinWasPressed(_ sender: UIButton) {
        
        changeLabel.text = "$\(productManager.addCreditsAndCalculateChange(amount: 10))0"
        creditsLabel.text = "$\(productManager.credits)0"
        nextButton.isEnabled = productManager.changeProductStatus()
        addColorToNextButton()
        
    }
    
    @IBAction func fivePesosCoinWasPressed(_ sender: UIButton) {
        changeLabel.text = "$\(productManager.addCreditsAndCalculateChange(amount: 5))0"
        creditsLabel.text = "$\(productManager.credits)0"
        nextButton.isEnabled = productManager.changeProductStatus()
        addColorToNextButton()
    }
    
    @IBAction func twoPesosCoinWasPressed(_ sender: UIButton) {
        changeLabel.text = "$\(productManager.addCreditsAndCalculateChange(amount: 2))0"
        creditsLabel.text = "$\(productManager.credits)0"
        nextButton.isEnabled = productManager.changeProductStatus()
        addColorToNextButton()
    }
    
    @IBAction func onePesoCoinWasPressed(_ sender: UIButton) {
        changeLabel.text = "$\(productManager.addCreditsAndCalculateChange(amount: 1))0"
        creditsLabel.text = "$\(productManager.credits)0"
        nextButton.isEnabled = productManager.changeProductStatus()
        addColorToNextButton()
    }
    
    
    //MARK: - PaymentVC Methods
    
    public func initProduct(with product : Product?) {
        
        if let selectedProduct = product {
            
            self.product = selectedProduct
            self.productManager.productPrice = selectedProduct.productCost
            
        }
                
    }
    
    private func updateViewWithProductInfo(product : Product?) {
        
        guard let selectedProduct = product else { return }
        
            productNameLabel.text = "\(selectedProduct.productName)"
            productImage.image = selectedProduct.productImage
            productPriceLabel.text = "$\(selectedProduct.productCost)0"
                    
    }
    
    private func addColorToNextButton() {
        
        if (nextButton.isEnabled) {
            
            nextButton.backgroundColor = #colorLiteral(red: 0.1572124362, green: 0.4650098085, blue: 0.7517459989, alpha: 1)
            
        } else {
            
            nextButton.backgroundColor = #colorLiteral(red: 0.1572124362, green: 0.4650098085, blue: 0.7517459989, alpha: 0.4529912243)
        }
        
    }
    
}
