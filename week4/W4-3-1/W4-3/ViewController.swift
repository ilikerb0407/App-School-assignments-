//
//  ViewController.swift
//  W4-3-1
//
//  Created by 莊凱富 on 2022/1/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelStationID: UILabel!
    
    @IBOutlet weak var labelStationName: UILabel!
    
    @IBOutlet weak var labelStationAddress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllData { allData in
            print(self.labelStationID as Any)
            print(self.labelStationName as Any)
            print(self.labelStationAddress as Any)
        }
        }

    
    func getAllData(handledata: @escaping(allData) -> Void) {
            // define url
            let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json")!
            //call url
            let _ = URLSession.shared.dataTask(with: url) { data, respone, error in
                guard let data = data else {return}
                // store data(left) in data(right)
                do {
                    let allDatas = try JSONDecoder().decode(allData.self, from: data)
                    //Instance method 'decode(_:from:)' requires that 'allData' conform to 'Decodable'
                    //use try to connect do/catch
                    DispatchQueue.main.sync {
                        let firstlabel = allDatas.stationID
                        self.labelStationID.text = firstlabel
                        let secondlabel = allDatas.stationName
                        self.labelStationName.text = secondlabel
                        let thirdlabel = allDatas.stationAddress
                        self.labelStationAddress.text = thirdlabel
                    }
                    //connect label with urldata
                }
                catch {
                    let error = error
                    print (error.localizedDescription)
                }
            }.resume()
    }
    
        
}



