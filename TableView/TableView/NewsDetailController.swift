//
//  NewsDetailController.swift
//  TableView
//
//  Created by 지원 on 2021/02/10.
//

import UIKit

class NewsDetailController: ViewController {
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    // 1. img 주소 불러와서 ImageMain에 띄우기
    // 2. description 불러와서 LabelMain.text 대치
    
    var imageUrl: String?
    var desc: String?
        
    override func viewDidLoad() {
        
        
        if let url = imageUrl {
            if let data = try? Data(contentsOf: URL(string: img)!) {
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
            
        }
        
        if let d = desc {
            self.LabelMain.text = d
        } else {
            self.LabelMain.text = nil
        }
        
        
        super.viewDidLoad()
    }
}
