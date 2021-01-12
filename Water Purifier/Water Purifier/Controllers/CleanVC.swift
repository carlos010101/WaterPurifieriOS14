//
//  CleanVC.swift
//  Water Purifier
//
//  Created by mac on 11/01/21.
//

import UIKit

class CleanVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var productImage: UIImageView!
    
    
    //MARK: - Properties
    private var product : Product?

    //MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.productImage.image = product?.productImage
        self.productImage.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
    }
    
    //MARK: - Methods
    
    func initProduct(product : Product?) {
        
        guard let selectedProduct = product else { return }
        
        self.product = selectedProduct
        
    }
    
}
