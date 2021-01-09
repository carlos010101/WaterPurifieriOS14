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
    
    var product : Product?
    
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
        
    }
    
    @IBAction func tenPesosCoinWasPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func fivePesosCoinWasPressed(_ sender: UIButton) {
    }
    
    @IBAction func twoPesosCoinWasPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func onePesoCoinWasPressed(_ sender: UIButton) {
        
    }
    
    
    //MARK: - PaymentVC Methods
    
    public func initProduct(with product : Product?) {
        
        self.product = product
                
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
