//
//  ViewController.swift
//  GCD
//
//  Created by Kai Fu Jhuang on 2022/3/29.
//

import UIKit

class ViewController: UIViewController {
    
    
    var firstData: Results?
    var secondData: Results?
    var thirdData: Results?
    
    @IBOutlet weak var firstAddress: UILabel!
    @IBOutlet weak var secondAddress: UILabel!
    @IBOutlet weak var thirdAddress: UILabel!
    
    @IBOutlet weak var firstSpeed: UILabel!
    @IBOutlet weak var secondSpeed: UILabel!
    @IBOutlet weak var thirdSpeed: UILabel!
    
    private let firstDataRequest = URLRequest(url: URL(string: "https://data.taipei/api/v1/dataset/5012e8ba-5ace-4821-8482-ee07c147fd0a?scope=resourceAquire&limit=1&offset=0")!)
    
    private let secondDataRequest = URLRequest(url: URL(string: "https://data.taipei/api/v1/dataset/5012e8ba-5ace-4821-8482-ee07c147fd0a?scope=resourceAquire&limit=1&offset=10")!)
    
    private let thirdDataRequest = URLRequest(url: URL(string: "https://data.taipei/api/v1/dataset/5012e8ba-5ace-4821-8482-ee07c147fd0a?scope=resourceAquire&limit=1&offset=20")!)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        getGroupAPI()
        getSemaphoreAPI()
        
    }
    
    
    func getGroupAPI() {
        
        let dispatchGroup = DispatchGroup()
        // firstAPI
        dispatchGroup.enter()
        URLSession.shared.dataTask(with: firstDataRequest, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let firstData = try decoder.decode(SpeedRestrictResponse.self, from: data)
                self.firstData = firstData.result.results[0]
                print ("=================\(firstData)===================")
                dispatchGroup.leave()
            } catch {
                print(error)
            }
        }) .resume()
        
        // second API
        dispatchGroup.enter()
        URLSession.shared.dataTask(with: secondDataRequest, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let secondData = try decoder.decode(SpeedRestrictResponse.self, from: data)
                self.secondData = secondData.result.results[0]
                print ("=================\(secondData)===================")
                dispatchGroup.leave()
            } catch {
                print(error)
            }
            
            
        }) .resume()
        
        // thirdAPI
        dispatchGroup.enter()
        URLSession.shared.dataTask(with: thirdDataRequest, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let thirdData = try decoder.decode(SpeedRestrictResponse.self, from: data)
                self.thirdData = thirdData.result.results[0]
                print ("=================\(thirdData)===================")
                dispatchGroup.leave()
            } catch {
                print(error)
            }
            
        }) .resume()
        
        dispatchGroup.notify(queue: .main) {
            self.firstAddress.text = self.firstData?.road
            self.firstSpeed.text = self.firstData?.speed
            self.secondAddress.text = self.secondData?.road
            self.secondSpeed.text = self.secondData?.speed
            self.thirdAddress.text = self.thirdData?.road
            self.thirdSpeed.text = self.thirdData?.speed
        }
    }
    
    
    
    func getSemaphoreAPI() {
        
        let semaphore = DispatchSemaphore(value: 1)
        
        let loadingQueue = DispatchQueue.global()
        
        loadingQueue.async {
            
            semaphore.wait()
            
            URLSession.shared.dataTask(with: self.firstDataRequest, completionHandler: { (data, responce, error) in
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let firstData = try decoder.decode(SpeedRestrictResponse.self, from: data)
                    self.firstData = firstData.result.results[0]
                    print ("=================\(firstData)===================")
                    semaphore.signal()
                    
                    DispatchQueue.main.async {
                        self.firstAddress.text = self.firstData?.road
                        self.firstSpeed.text = self.firstData?.speed
                    }
                    
                } catch {
                    print(error)
                }
                
            }).resume()
            
        }
        
        loadingQueue.async {
            semaphore.wait()
            // valur = -1
            URLSession.shared.dataTask(with: self.secondDataRequest, completionHandler: { (data, responce, error) in
                
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let secondData = try decoder.decode(SpeedRestrictResponse.self, from: data)
                    self.secondData = secondData.result.results[0]
                    print ("=================\(secondData)===================")
                    semaphore.signal()
                    DispatchQueue.main.async {
                        self.secondAddress.text = self.secondData?.road
                        self.secondSpeed.text = self.secondData?.speed
                    }
                    
                } catch {
                    print(error)
                }
                
            }).resume()
            
        }
        loadingQueue.async {
            
            semaphore.wait()
            URLSession.shared.dataTask(with: self.thirdDataRequest, completionHandler: { (data, responce, error) in
                
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let thirdData = try decoder.decode(SpeedRestrictResponse.self, from: data)
                    self.thirdData = thirdData.result.results[0]
                    
                    print ("=================\(thirdData)===================")
                    
                    semaphore.signal()
                    DispatchQueue.main.async {
                        self.thirdAddress.text = self.thirdData?.road
                        self.thirdSpeed.text = self.thirdData?.speed
                    }
                    
                } catch {
                    print(error)
                }
                
            }).resume()
            
        }
    }
    
}

