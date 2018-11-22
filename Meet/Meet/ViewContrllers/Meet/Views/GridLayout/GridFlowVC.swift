//
//  GridFlowVC.swift
//  Meet
//
//  Created by PW on 2018/11/21.
//  Copyright © 2018 潘威. All rights reserved.
//

import UIKit

class GridFlowVC: UIViewController {

    @IBOutlet var aCollectionView: UICollectionView!
    @IBOutlet weak var flowLayout: GridFlowLayout!

    var items = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }


    func setupView() {
        // UICollectionView註冊cell
        let meetHomeNib = UINib(nibName: "MeetHomeCell", bundle: nil)
        aCollectionView.register(meetHomeNib, forCellWithReuseIdentifier: "MeetHomeCell")

        // 產生1000個圖片，圖片檔案從bg-0到bg-57
        var pos = 0
        for _ in 1...100 {

//            let meetItemModel = MeetItemModel()

            if let image = UIImage(named: "bg-\(pos)") {
                items.append(image)
            }

            pos += 1
            if pos == 58 {
                pos = 0
            }

        }

        flowLayout.items = items
        aCollectionView.collectionViewLayout = flowLayout
    }

}

// MARK: UICollectionViewDataSource
extension GridFlowVC: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeetHomeCell", for: indexPath) as! MeetHomeCell
        aCell.imageView.image = items[indexPath.row]
        return aCell

    }

}

