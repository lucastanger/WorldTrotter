//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Luca Stanger on 02.03.20.
//  Copyright © 2020 Luca Stanger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        view.addSubview(firstView)
    }


}

