//
//  ViewController.swift
//  UpDownGame
//
//  Created by 지원 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValueLabel.text = String(Int(sender.value))
    }
    
    func showAlert (msg: String) {
        let alert = UIAlertController(title: nil,
                                      message: msg,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
            self.reset()
        }
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {
//        slider.value = Float(Int(slider.value)) // 보정을 위해 float 형태의 숫자 (xx.00)으로 변환
        let hitValue = Int(slider.value)
        slider.value = Float(hitValue)
        
        // tryCount : hit 버튼 클릭함에 따라 tryCountLabel의 텍스트를 변경하는 메서드
        tryCount = tryCount + 1
        tryCountLabel.text = String("\(tryCount) / 5")
        
        // 사용자가 랜덤값을 맞혔을 경우 로그 띄울 수 있도록
        if randomValue == hitValue {
            showAlert(msg: "YOU WIN!!")
            reset()
        } else if tryCount >= 5 {
            showAlert(msg: "FAIL")
            reset()
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
            
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        reset()
    }
    
    func reset() {
        print("reset!")
        randomValue = Int.random(in:1...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
        
    }

}

