//
//  ViewController.swift
//  GoodocKit
//
//  Created by Woody on 2017. 2. 13..
//  Copyright © 2017년 Goodoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.backgroundColor = UIColor(hex: "#00ccff")
        view2.backgroundColor = UIColor(hex: "컬러아님",defaultHex:"cccccc")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

