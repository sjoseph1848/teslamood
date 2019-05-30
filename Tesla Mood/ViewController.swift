//
//  ViewController.swift
//  Tesla Mood
//
//  Created by Samuel Joseph on 5/28/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    
    @IBOutlet weak var stockLabel: UILabel! //locationlabel
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!  //temperatureLabel
    @IBOutlet weak var backgroundView: UIView!
    
    let gradientLayer = CAGradientLayer()
    let url = URL(string: "https://financialmodelingprep.com/api/company/rating/AAPL?datatype=json")
//    var activityIndicator : NVActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       backgroundView.layer.addSublayer(gradientLayer)
        
        let indicatorSize:CGFloat = 70
        let indicatorFrame = CGRect(x:(view.frame.width-indicatorSize)/2,y:(view.frame.height-indicatorSize)/2,width: indicatorSize,height:indicatorSize)
//        activityIndicator = NVActivityIndicatorView(frame:indicatorFrame,type:.lineScale,color:UIColor.white,padding:20.0)
//        activityIndicator.backgroundColor = UIColor.black
//        view.addSubview(activityIndicator)
      
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         setBlueGradientBackground()
            callStock()
        print("Hey")
        
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
            guard let title = jsonArray[1]["symbol"] as? String else { return }
            print(title)
            for dic in jsonArray{
                guard let title = dic["symbol"] as? String else { return }
                print(title) //Output
                
            }
            
        }
        
        
        
        task.resume()

    }
    
  
}

