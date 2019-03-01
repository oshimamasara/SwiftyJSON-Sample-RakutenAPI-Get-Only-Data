import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://app.rakuten.co.jp/services/api/Product/Search/20170426?format=json&keyword=%E7%B4%94%E7%B1%B3%E5%A4%A7%E5%90%9F%E9%86%B8%2C%201.8L&hits=30&minPrice=7000&applicationId= APP ID ")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {return}
            do {
                let json = try? JSON(data: data)
                let jsonData = json!["Products"][0]["Product"]["productName"]
                print(jsonData)
            } catch let jsonError{
                print("jsonError", jsonError)
            }
            }.resume()
    }
}
