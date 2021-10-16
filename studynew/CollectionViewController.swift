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
    let Konkais = try! Realm().objects(Konkai.self)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.collectionView.reloadData() // データの再読み込み
   
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.reloadData()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        //        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    //     MARK: UICollectionViewDataSource
    
    //    override func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 5
    //    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Konkais.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
      //表示する時間の単位をそろえる＆小数点以下切り捨て
        let timeInt = Int(Konkais[indexPath.row].konkai)
        let s = (timeInt) % 60
        let m = (timeInt - s) / 60 % 3600
//        mokuhyoulabel.text = String(format: "%02d:%02d", m,s)
        
        cell.frame.size = CGSize(width: 128, height: 128)
        cell.contentView.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
        
        (cell.contentView.viewWithTag(1) as? UILabel)?.text = String(format: "%02d:%02d", m,s)
        (cell.contentView.viewWithTag(2) as? UIImageView)?.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
        (cell.contentView.viewWithTag(2) as? UIImageView)?.image = UIImage(named: "good")
        
//        (cell.contentView.viewWithTag(1) as? UILabel)?.text = String(Konkais[indexPath.row].konkai)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
