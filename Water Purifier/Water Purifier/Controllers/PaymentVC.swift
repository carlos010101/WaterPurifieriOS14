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
        initViewWithProductInfo(product: product)
        navigationItem.backBarButtonItem?.title = "Regresar"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    //MARK: - Actions
    
    @IBAction func nextButtonWasPressed(_ sender: UIButton) {
        
        switch self.product?.productType {
        
        case .garrafonCompleto:
            
            performSegue(withIdentifier: K.Segues.toCleanSegue, sender: self)
            
        case .medioGarrafon :
            
            performSegue(withIdentifier: K.Segues.toCleanSegue, sender: self)
            
        case .botella :
            
            performSegue(withIdentifier: K.Segues.toFillSegue, sender: self)
        
        default:
            
            fatalError("No product selected")
            break
        }
    }
    
    @IBAction func tenPesosCoinWasPressed(_ sender: UIButton) {
        updateViewWithProductInfo(amount: 10)
    }
    
    @IBAction func fivePesosCoinWasPressed(_ sender: UIButton) {
        updateViewWithProductInfo(amount: 5)
    }
    
    @IBAction func twoPesosCoinWasPressed(_ sender: UIButton) {
        updateViewWithProductInfo(amount: 2)
    }
    
    @IBAction func onePesoCoinWasPressed(_ sender: UIButton) {
        updateViewWithProductInfo(amount: 1)
    }
    
    
    //MARK: - PaymentVC Methods
    
    public func initProduct(with product : Product?) {
        
        guard let selectedProduct = product else { return }
            
            self.product = selectedProduct
            self.productManager.productPrice = selectedProduct.productCost
    }
    
    private func initViewWithProductInfo(product : Product?) {
        
        guard let selectedProduct = product else { return }
        
            productNameLabel.text = "\(selectedProduct.productName)"
            productImage.image = selectedProduct.productImage
            productPriceLabel.text = "$\(selectedProduct.productCost)0"
                
    }
    
    private func updateViewWithProductInfo(amount : Double) {
        
        changeLabel.text = "$\(productManager.addCreditsAndCalculateChange(amount))0"
        creditsLabel.text = "$\(productManager.credits)0"
        nextButton.isEnabled = productManager.changeProductStatus()
        addColorToNextButton()
        
    }
    
    private func addColorToNextButton() {
        
        if (nextButton.isEnabled) {
            
            nextButton.backgroundColor = #colorLiteral(red: 0.1572124362, green: 0.4650098085, blue: 0.7517459989, alpha: 1)
            
        } else {
            
            nextButton.backgroundColor = #colorLiteral(red: 0.1572124362, green: 0.4650098085, blue: 0.7517459989, alpha: 0.4529912243)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cleanVC = segue.destination as? CleanVC {
            
            cleanVC.initProduct(product: self.product)
            
        }
        
    }
    
    
    
}
