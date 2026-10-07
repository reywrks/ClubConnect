//
//  ViewController.swift
//  ClubConnect
//
//  Created by CEZAR REY BALLAD on 9/23/26.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Camp Club"
        
        // Set the welcome screen's title through code.
        titleLabel.text = "Camp Club"
    }
}
