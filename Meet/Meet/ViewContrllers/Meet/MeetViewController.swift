//
//  MeetViewController.swift
//  Meet
//
//  Created by 潘威 on 2018/11/5.
//  Copyright © 2018 潘威. All rights reserved.
//

import UIKit

class MeetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let girdVC = GridFlowVC(nibName: "GridFlowVC", bundle: nil)
        self.addChild(girdVC)
        self.view.addSubview(girdVC.view)
        girdVC.view.frame = CGRect.init(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
        let leftItem = UIBarButtonItem(title: "北京", style: UIBarButtonItem.Style.plain, target: self, action: #selector(locationClick))
        self.navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(image: UIImage(named: "more"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(moreClick))
        self.navigationItem.rightBarButtonItem = rightItem
    }

    @objc func locationClick() {
        print("获取定位")
    }

   @objc func moreClick() {
        print("更多")
    }



}
