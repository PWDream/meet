//
//  MeetHomeCell.swift
//  Meet
//
//  Created by PW on 2018/11/21.
//  Copyright © 2018 潘威. All rights reserved.
//

import UIKit

class MeetHomeCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var despLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var diamondImageView: UIImageView!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var navigationImageView: UIImageView!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var watchImageView: UIImageView!

    public var meetItem:MeetItemModel?{
        didSet{
            imageView.image = UIImage(named: (meetItem?.imageUrl)!)
            despLabel.text = meetItem?.desc
            nameLabel.text = meetItem?.name
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 240/255, green: 238/255, blue: 249/255, alpha: 1)
        addClickEvent(imageView: imageView)
        addClickEvent(imageView: avatarImageView)
        addClickEvent(imageView: diamondImageView)
        addClickEvent(imageView: navigationImageView)
        addClickEvent(imageView: contactImageView)
        addClickEvent(imageView: heartImageView)
        addClickEvent(imageView: watchImageView)
    }

    func addClickEvent(imageView:UIImageView)  {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print(tappedImage)
  }

}
