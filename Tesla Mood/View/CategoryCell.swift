//
//  CategoryCell.swift
//  Tesla Mood
//
//  Created by Samuel Joseph on 6/15/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImg: UIImageView!
    
    @IBOutlet weak var categoryTitle: UILabel!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       categoryImg.layer.cornerRadius = 10
    }
    
    func configureCell(category:NewsItem){
        categoryImg.image = UIImage(named:category.imageName)
        categoryTitle.text = category.title
        
    }

   

}
