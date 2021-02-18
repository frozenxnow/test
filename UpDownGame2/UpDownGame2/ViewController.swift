//
//  ViewController.swift
//  UpDownGame2
//
//  Created by 지원 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

    var random: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var inputValue: UILabel!
    @IBOutlet weak var minimum: UILabel!
    @IBOutlet weak var maximum: UILabel!
    @IBOutlet weak var tryCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
    }
    
    @IBAction func moveSlider (_ sender:UIView) {
        print(slider.value)
        inputValue.text = String(Int(slider.value))
    }
    
    func showAlert(msg: String) {
        let alert = UIAlertController(title: nil,
                                      message: msg,
                                      preferredStyle: .alert)
        let okay = UIAlertAction(title: "OK",
                                 style: .default) { (action) in
            self.reset()
        }
        alert.addAction(okay)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    @IBAction func touchUpHitButton (_ sender:UIButton) {
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        let hitValue: Int = Int(slider.value)
        if random == hitValue {
//            print("성공")
            showAlert(msg: "성공")
            reset()
        } else if tryCount >= 5 {
//            print("실패")
            showAlert(msg: "실패")
            reset()
        } else if random > hitValue {
            minimum.text = String(hitValue)
            slider.minimumValue = slider.value
        } else {
            maximum.text = String(hitValue)
            slider.maximumValue = slider.value
        }
    }

    @IBAction func touchUpResetButton(_ sender: UIButton) {
        reset()
    }
    
    func reset() {
        random = Int.random(in: 1...30)
        print(random)
        
        slider.minimumValue = 0
        minimum.text = "0"
        
        slider.maximumValue = 30
        maximum.text = "30"
        
        slider.value = 15
        inputValue.text = "15"
        
        tryCount = 0
        tryCountLabel.text = "0 / 5"

    }
    
}

