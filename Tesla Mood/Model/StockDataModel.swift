//
//  Stock.swift
//  Tesla Mood
//
//  Created by Samuel Joseph on 5/30/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import Foundation













//struct Stock {
//    let symbol:String
//    let price: Double
//    let updatedAt:String
//
//    enum SerializationError:Error {
//        case missing(String)
//        case invalid (String, Any)
//    }
//
//    init(json:[String:Any]) throws {
//        guard let symbol = json["symbol"] as? String else {throw SerializationError.missing("symbol is missing")}
//
//        guard let price = json["price"] as? Double else {throw SerializationError.missing("price is missing")}
//
//        guard let updatedAt = json["updated_at"] as? String else {throw SerializationError.missing("updated_at is missing")}
//
//        self.symbol = symbol
//        self.price = price
//        self.updatedAt = updatedAt
//
//
//    }
//
//    static let basePath = "https://financialmodelingprep.com/api/company/real-time-price/AAPL"
//
//
//    static func stockPrice (completion:@escaping([Stock]) -> ()){
//        let url = basePath
//        let request = URLRequest(url:URL(string:url)!)
//
//        let task = URLSession.shared.dataTask(with: request) {(data:Data?,response:URLResponse?,error:Error?) in
//
//            //var stockArray:[Stock] = []
//
//            if let data = data {
//
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
//                        for datapoint in json{
//                            if let stockObject = try? Stock(json: datapoint){
//                                stockArray.append(stockObject)
//                            }
//                        }
//
//
//                    }
//
//
//
//                }catch {
//                    print(error.localizedDescription)
//                }
//            }
//
//        }
//
//        task.resume()
//    }

//}
