//
//  MyHomeViewController.swift
//  Greenify
//
//  Created by Erik Seitz on 4/9/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import UIKit

class MyHomeViewController: UIViewController {

    @IBOutlet weak var mainRatingView: MainRatingView!
    @IBOutlet weak var mainRating: UILabel!
    
    @IBOutlet weak var waterRatingView: WaterRatingView!
    @IBOutlet weak var waterRating: UILabel!
    
    
    @IBOutlet weak var energyRatingView: EnergyRatingView!
    @IBOutlet weak var energyRating: UILabel!
    var homeStruct: HomeStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainRating.text =  String(mainRatingView.counter)
        waterRating.text = String(waterRatingView.counter)
        energyRating.text = String(energyRatingView.counter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
