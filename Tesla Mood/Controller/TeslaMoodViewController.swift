//
//  ViewController.swift
//  Tesla Mood
//
//  Created by Samuel Joseph on 5/28/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    
    @IBOutlet weak var stockLabel: UILabel! //locationlabel
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!  //temperatureLabel
    @IBOutlet weak var backgroundView: UIView!
    
    let gradientLayer = CAGradientLayer()
    let url = URL(string: "https://financialmodelingprep.com/api/company/rating/AAPL?datatype=json")
    var activityIndicator : NVActivityIndicatorView!
    let base = "https://financialmodelingprep.com/api/company/real-time-price/AAPL,TSLA?datatype=json"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       backgroundView.layer.addSublayer(gradientLayer)
        
        let indicatorSize:CGFloat = 70
        let indicatorFrame = CGRect(x:(view.frame.width-indicatorSize)/2,y:(view.frame.height-indicatorSize)/2,width: indicatorSize,height:indicatorSize)
        activityIndicator = NVActivityIndicatorView(frame:indicatorFrame,type:.lineScale,color:UIColor.white,padding:20.0)
        activityIndicator.backgroundColor = UIColor.black
        view.addSubview(activityIndicator)
      
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            
            callStock()
            getTeslaData(url: base)
        
    }
    
    func setBlueGradientBackground(){
        let topColor = UIColor(red:95.0/255.0,green:165.0/255.0,blue:1.0,alpha:1.0).cgColor
        let bottomoColor = UIColor(red:72.0/255.0,green:114.0/255.0,blue:184.0/255.0,alpha:1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor,bottomoColor]
        
    }
    
    func setGreyGradientBackground(){
        let topColor = UIColor(red:151.0/255.0,green:151.0/255.0,blue:151.0/255.0,alpha:1.0).cgColor
        let bottomoColor = UIColor(red:72.0/255.0,green:72.0/255.0,blue:72.0/255.0,alpha:1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor,bottomoColor]
    }
    
    func setGreenGradientBackground(){
        gradientLayer.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor]
        gradientLayer.frame = view.bounds
    }
    
    func setGreenGreenGradientBackground(){
        gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.green.cgColor]
        gradientLayer.frame = view.bounds
    }
    
    func setRedGradientBackground(){
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.darkGray.cgColor]
        gradientLayer.frame = view.bounds
    }
    
    func setRedRedGradientBackground(){
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.black.cgColor]
        gradientLayer.frame = view.bounds
    }
    
    func setNeturalGradientBackground(){
        gradientLayer.colors = [UIColor.darkGray.cgColor,UIColor.black.cgColor]
        gradientLayer.frame = view.bounds
    }
    
    func setLowestPrice(){
        self.setRedRedGradientBackground()
        
    }
    
    func setSecondLowestPrice(){
        self.setRedGradientBackground()
    }
    
    
    func setNeutralPrice(){
        self.setNeturalGradientBackground()
        self.conditionImageView.image = UIImage(named: "sadbroker")
        self.conditionLabel.text = "Better than this guy on Black Tuesday"
    }
    
    func setHigherPrice(){
        self.setGreenGradientBackground()
    }
    
    func setHighestPrice(){
        self.setGreenGreenGradientBackground()
    }
    
    
    func getTeslaData(url:String){
        
        Alamofire.request(url,method: .get).responseJSON{
            response in
            if response.result.isSuccess {
                print("Success! Got the tesla data")
                
                let teslaJSON : JSON = JSON(response.result.value!)
                print(teslaJSON)
                //self.updateWeatherData(json: weatherJSON)
                
            }
            else{
                print("Error \(response.result.error)")
                //self.cityLabel.text = "Connection Issues"
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func callStock(){
        let url = URL(string: "https://financialmodelingprep.com/api/company/real-time-price/AAPL,TSLA?datatype=json")
        var request = URLRequest(url: url!)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            guard let jsonArray = json as? [[String: Any]] else {
                return
            }
            print(jsonArray)
            //Now get title value
            guard let title = jsonArray[1]["price"] as? Double else { return }
            print(title)
            for dic in jsonArray{
                guard let title = dic["price"] as? Double else { return }
                DispatchQueue.main.async { // Correct
                    self.priceLabel.text = "\(title)"
                    
                    
                    
                    if title < 185 {
                        
                        self.setRedGradientBackground()
                    }else if title < 195 {
                        
                         self.setNeutralPrice()
                    } else if title < 250 {
                        
                        self.setGreenGreenGradientBackground()
                    }
                    
                }
                
                
            }
            
        }
        
        
        
        task.resume()

    }
    
  
}

