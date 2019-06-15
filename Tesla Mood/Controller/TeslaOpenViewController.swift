//
//  TeslaOpenViewController.swift
//  Tesla Mood
//
//  Created by Samuel Joseph on 6/10/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit

class TeslaOpenViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{


    @IBOutlet weak var tableView: UITableView!
    
    let data = DataSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Now TableView knows how many rows are in section and how many to display
        print(data.news.count)
        return data.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell",for:indexPath) as? CategoryCell {
            cell.configureCell(category: data.news[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


}
