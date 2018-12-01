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

    var items = [MeetItemModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }


    func setupView() {
        // UICollectionView註冊cell
        let meetHomeNib = UINib(nibName: "MeetHomeCell", bundle: nil)
        aCollectionView.register(meetHomeNib, forCellWithReuseIdentifier: "MeetHomeCell")

        // 產生1000個圖片，圖片檔案從bg-0到bg-57
        var index = 0
        for _ in 1...1000 {
            let meetItemModel = MeetItemModel(desc: "Hello\(index)",name:"PW\(index)",imageUrl:"bg-\(index % 57)")
            items.append(meetItemModel)
            index += 1
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
        aCell.meetItem = items[indexPath.row]
        return aCell
    }

}

