//
//  ViewController.swift
//  Tesla Mood
//
//  Created by Samuel Joseph on 5/28/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView
import CoreLocation

class ViewController: UIViewController {

    
    @IBOutlet weak var stockLabel: UILabel! //locationlabel
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!  //temperatureLabel
    @IBOutlet weak var backgroundView: UIView!
    
    let gradientLayer = CAGradientLayer()
    
    var activityIndicator : NVActivityIndicatorView!
    
    
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
         setBlueGradientBackground()
            callApi()
        print("Hey")
        
    }
    
    
    
    func callApi(){
        Alamofire.request("https://financialmodelingprep.com/api/company/real-time-price/TSLA").responseJSON{
             response in
            if let json = response.result.value {
                 print("JSON: \(json)")
              
            }
        }
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

}

