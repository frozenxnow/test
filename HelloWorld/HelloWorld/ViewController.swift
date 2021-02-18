//
//  ViewController.swift
//  HelloWorld
//
//  Created by 지원 on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func clickButton(_ sender: Any) {
        if let detailController = self.storyboard?.instantiateViewController(identifier: "DetailController") {
            self.navigationController?.pushViewController(detailController, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


