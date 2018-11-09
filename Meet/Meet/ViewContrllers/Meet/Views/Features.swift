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
        let featuresIcons = ["wealth.png","faceValue.png","temperament.png","pengpeng.png"]
        let item1 = FeatureItemObject(icon: "wealth.png", name: "财富")
        let item2 = FeatureItemObject(icon: "faceValue.png", name: "颜值")
        let item3 = FeatureItemObject(icon: "temperament.png", name: "气质")
        let item4 = FeatureItemObject(icon: "pengpeng.png", name: "对对碰")
        let features = [item1，item2，item3，item4]
        let width = NSInteger(self.frame.size.width) / featuresIcons.count, height = 60
        var index = 0
        featuresIcons.forEach { (icon) in
            let itemView = FeaturesItem.featureItemView()
            itemView.frame = CGRect.init(x: index * width, y: 0, width: width, height: height)
            itemView.icon = icon
            itemView.labelStr = icon
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
