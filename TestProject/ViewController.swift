//
//  ViewController.swift
//  TestProject
//
//  Created by gustavo on 14/06/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        RecomendedMoviesWorker(id: 12).doWork { response in
            if let res = response {
                print(res)
            }
        }
    }


}

