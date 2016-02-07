//
//  TresViewController.swift
//  ConfigurationTest
//
//  Created by Mateusz Małek on 09.12.2015.
//  Copyright © 2015 Mateusz Małek. All rights reserved.
//

import Foundation
import UIKit

class TresViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var perspectiveTransform = CATransform3DIdentity
        perspectiveTransform.m34 = 1 / -900
        self.imageView.layer.sublayerTransform = perspectiveTransform
        imageView.layer.anchorPoint = CGPointMake(0.5, 0.0)
        imageView.layer.doubleSided = false
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
