//
//  ViewController.swift
//  StringObfuscation
//
//  Created by Gabriel Cuesta Arza on 8/6/17.
//  Copyright © 2017 Gabriel Cuesta Arza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let variable = "Hello world!"
        
        let o = Obfuscator(withSalt: [AppDelegate.self, NSObject.self, NSString.self])
        let bytes = o.bytesByObfuscatingString(string: variable)
        print(bytes) /*[110, 97, 80, 70, 65, 122, 87, 83, 67, 50, 33, 34]*/
        
        let value = o.reveal(key: bytes)
        print(value) /*555555556ABC*/
        
        labelTxt.text = value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

