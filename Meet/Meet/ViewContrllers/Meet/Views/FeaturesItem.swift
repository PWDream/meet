//
//  FeaturesItem.swift
//  Meet
//
//  Created by 潘威 on 2018/11/5.
//  Copyright © 2018 潘威. All rights reserved.
//

import UIKit

public class FeaturesItem: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    public var icon:String? {
        didSet{
            let image = UIImage(named: icon!)
            self.imageView.image = image
        }
    }
    public var labelStr:String?{
        didSet{
            self.label.text = labelStr
        }
    }
    
    
    static func featureItemView() -> FeaturesItem {
        return Bundle.main.loadNibNamed("FeaturesItem", owner: nil, options: nil)?.first as! FeaturesItem
    }
}
