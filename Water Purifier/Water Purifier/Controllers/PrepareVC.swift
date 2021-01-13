//
//  PrepareVC.swift
//  Water Purifier
//
//  Created by mac on 13/01/21.
//

import UIKit

class PrepareVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var productToFillImage: UIImageView!
    
    //MARK: - Variables
    
    public var product : Product?
    
    //MARK: - Lyfe Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initViewWithProductInfo(with: product)
    }
    
    //MARK: - Actions
    
    @IBAction func fillWasPressed(_ sender: UIButton) {
        
        print("Fill")
        
    }
    
    //MARK: - Methods
    
    public func initProduct(product: Product?) {

        guard let selectedProduct = product else { return }
        
        self.product = selectedProduct
        
    }
    
    private func initViewWithProductInfo(with product : Product?) {
        
        guard let selectedProduct = product else { return }
        
        self.productToFillImage.image = selectedProduct.productImage
        
    }
    
    
    
    
}