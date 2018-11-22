//
//  Features.swift
//  Meet
//
//  Created by 潘威 on 2018/11/5.
//  Copyright © 2018 潘威. All rights reserved.
//

import UIKit

class Features: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame:frame)
        let features = ["财富":"wealth.png","颜值":"faceValue.png","气质":"temperament.png","对对碰":"pengpeng.png",]
        let width = NSInteger(self.frame.size.width) / features.keys.count, height = 60
        var index = 0
        for (key,value) in features {
            let itemView = FeaturesItem.featureItemView()
            itemView.frame = CGRect.init(x: index * width, y: 0, width: width, height: height)
            itemView.icon = value
            itemView.labelStr = key
            self.addSubview(itemView)
            index += 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public class FeatureItemObject {
    public var icon:String
    public var name:String
    init(icon:String,name:String) {
        self.icon = icon
        self.name = icon
    }
}
