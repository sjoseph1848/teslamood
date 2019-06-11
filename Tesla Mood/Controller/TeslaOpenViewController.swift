//
//  TeslaOpenViewController.swift
//  Tesla Mood
//
//  Created by Samuel Joseph on 6/10/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit

class TeslaOpenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSecondScreen", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
