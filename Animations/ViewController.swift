//
//  ViewController.swift
//  Animations
//
//  Created by Yi Wang on 3/4/19.
//  Copyright © 2019 Yi Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientView: GradientView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gradientView.topColor = UIColor.red
        gradientView.bottomColor = UIColor.orange
        gradientView.move(to: CGPoint(x: 150, y: 150), duration: 3, options: UIView.AnimationOptions.curveEaseIn)
        
    }
}

