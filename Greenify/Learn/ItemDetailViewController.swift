//
//  ItemDetailViewController.swift
//  Greenify
//
//  Created by Brendan Slack on 4/18/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet private weak var detailText: UITextView!
    var textToDisplay = "This furnace sucks"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        detailText.text = textToDisplay
        // Do any additional setup after loading the view.
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
