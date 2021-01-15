//
//  FillVC.swift
//  Water Purifier
//
//  Created by mac on 14/01/21.
//

import UIKit

class FillVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var thanksStack: UIStackView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var processLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //MARK: - Variables
    
    private var product : Product?
    private var timer = Timer()
    private var totalTime : Int?
    private var secondsPassed = 0
    
    
    //MARK: - Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initView(with: product)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public func initProduct (with product : Product?) {
        
        guard let selectedProduct = product else { return }
        
        self.product = selectedProduct
        self.totalTime = selectedProduct.timeToFill
        
    }
    
    private func initView (with product : Product?) {
        
        guard let selectedProduct = product else { return }
        
        self.productImage.image = selectedProduct.productImage
        self.thanksStack.isHidden = true
        self.timer.invalidate()
        self.progressBar.progress = 0.0
        
    }
    
    private func fill () {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }
    
    @objc private func updateTimer () {
        
        
        
    }

}
