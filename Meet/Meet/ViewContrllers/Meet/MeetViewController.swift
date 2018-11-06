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

        let featuresView = Features.init(frame: CGRect.init(x: 0, y: self.view.frame.height - 110, width: self.view.frame.width, height: 60))
        self.view.addSubview(featuresView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
