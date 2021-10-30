//
//  CollectionViewController.swift
//  studynew
//
//  Created by アオイ on 2021/06/05.
//

import UIKit
import RealmSwift

//private let reuseIdentifier = "Cell"

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let realm = try! Realm()
    //    let Mokuhyous = try! Realm().objects(Mokuhyou.self)
    let Mokuhyous = try! Realm().objects(Mokuhyou.self)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.collectionView.reloadData() // データの再読み込み
   
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.reloadData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
      
       
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
    }
    
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Mokuhyous.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
      //表示する時間の単位をそろえる＆小数点以下切り捨て
        let timeInt = Int(Mokuhyous[indexPath.row].mokuhyou)
        let s = (timeInt) % 60
        let m = (timeInt - s) / 60 % 3600
//        mokuhyoulabel.text = String(format: "%02d:%02d", m,s)
        //cellのサイズ指定
        cell.frame.size = CGSize(width: 128, height: 128)
        cell.contentView.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
        
        
        (cell.contentView.viewWithTag(1) as? UILabel)?.text = stringFromDate(dat: Mokuhyous[indexPath.row].date!, format: "MM/dd")
        (cell.contentView.viewWithTag(2) as? UIImageView)?.frame = CGRect(x: 0, y: 0, width: 128, height: 128)

   if timeInt <= 0
   {
    (cell.contentView.viewWithTag(2) as? UIImageView)?.image = UIImage(named: "good")
   }
   else {
    (cell.contentView.viewWithTag(2) as? UIImageView)?.image = UIImage(named: "booo")
   }
        
//        (cell.contentView.viewWithTag(1) as? UILabel)?.text = String(Konkais[indexPath.row].konkai)
        
        return cell
    }
    
   
    
    private func stringFromDate(dat: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: dat)
    }
    
}

