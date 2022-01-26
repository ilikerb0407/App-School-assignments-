//
//  ViewController.swift
//  W4-1
//
//  Created by 莊凱富 on 2022/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    
        
    @IBOutlet weak var labelStationID: UILabel!
    
    @IBOutlet weak var labelStationName: UILabel!
    
    @IBOutlet weak var labelStationAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllDate { [self] allData in
            for _ in [self] {
                labelStationID.text = allData.stationID
                labelStationName.text = allData.stationName
                labelStationAddress.text = allData.stationAddress
            }
        }
        }
    }
    
    func getAllDate(handledata: @escaping(allData) -> Void) {
        
        let url = URL(string: "https://stations-98a59.firebaseio.com/practice.json")!
        
        let word = URLSession.shared.dataTask(with: url) { data, respone, error in
            
            guard let data = data else {return}
            do {
                let allData = try JSONDecoder().decode(allData.self, from: data)
                //Instance method 'decode(_:from:)' requires that 'allData' conform to 'Decodable'
                handledata(allData)
            }
            catch {
                let error = error
                print (error.localizedDescription)
            }
        }.resume()
        
    }



