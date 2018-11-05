//
//  MainViewController.swift
//  Meet
//
//  Created by 潘威 on 2018/11/5.
//  Copyright © 2018 潘威. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let meetVC = MeetViewController()
        let showVC = ShowViewController()
        let newsVC = NewsViewController()
        let mineVC = MineViewController()
    }
    
    

}
