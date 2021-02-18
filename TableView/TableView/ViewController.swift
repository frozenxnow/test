//
//  ViewController.swift
//  TableView
//
//  Created by 지원 on 2021/02/08.
//

// API: https://newsapi.org/v2/everything?q=tesla&from=2021-01-10&sortBy=publishedAt&apiKey=b2b93c5cacf1431381f8f7ccda9c2454


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewMain: UITableView!
    var newsData: Array<Dictionary<String, Any>>? = nil
    
    func getNews() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-01-10&sortBy=publishedAt&apiKey=b2b93c5cacf1431381f8f7ccda9c2454")!) { (data, urlResponse, error) in
            if let dataJson = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    var articles = json["articles"] as! Array<Dictionary<String, Any>>
                    self.newsData = articles
                    DispatchQueue.main.async {
                        self.tableViewMain.reloadData()
                    }
                    //                    for (idx, value) in articles.enumerated() {
                    //                        if let v = value as? Dictionary<String, Any> {
                    //                            print(v["title"])
                    //                        }
                    //                    }
                }
                catch {}
            }
            
        }
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let news = newsData {
            return news.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        if let news = newsData {
            
            let idx = indexPath.row
            let row = news[idx]

            if let r = row as? Dictionary<String, Any> {
                if let title = r["title"] as? String {
                    cell.Type1Label.text = title
                }
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click!! \(indexPath.row)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        getNews()
    }
}

