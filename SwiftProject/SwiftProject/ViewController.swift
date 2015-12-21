//
//  ViewController.swift
//  SwiftProject
//
//  Created by THN-Huangfei on 15/12/21.
//  Copyright © 2015年 JD-Huangfei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.  
        
        var string: String = ""
        
        print("输入：", separator: "1", terminator: "2", toStream: &string)
//        print(string)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

