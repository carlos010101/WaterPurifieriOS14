//
//  FillVC.swift
//  Water Purifier
//
//  Created by mac on 14/01/21.
//

import UIKit
import AVFoundation

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
    private var player : AVAudioPlayer!
    
    
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
        fill()
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
        
        if secondsPassed < totalTime ?? 0 {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime!) //Progreso
            print(Float(secondsPassed) / Float(totalTime!))
            print(secondsPassed)
        
        } else {
            
            timer.invalidate()
            playSound()
            thanksStack.isHidden = false
            progressBar.isHidden = true
            processLabel.text = "completado"
            timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { (timer) in
                
                self.navigationController?.popToRootViewController(animated: true)
                
            })
            
        }
        
    }
    
    private func playSound() {
        
        let url = Bundle.main.url(forResource: "bell", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }

}
