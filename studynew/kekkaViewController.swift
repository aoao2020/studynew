//
//  kekkaViewController.swift
//  studynew
//
//  Created by アオイ on 2021/02/27.
//

import UIKit
import RealmSwift

class kekkaViewController: UIViewController {
    
    let realm = try! Realm()
    var Mokuhyous = try! Realm().objects(Mokuhyou.self).last
    var Konkais = try! Realm().objects(Konkai.self).last
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var count: Int = 0
    var saveDate: UserDefaults = UserDefaults.standard
    @IBOutlet var nowtimeLabel: UILabel!
    @IBOutlet var mokuhyoulabel: UILabel!
    
    var still: Double = 0.0
    
    
    var outputValue : TimeInterval?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let memo: Mokuhyou? = read()
        let neko: Konkai? = read()
     //あと何分目標まで必要なのかの計算
        still = Double(Mokuhyous!.mokuhyou - (outputValue ?? 0))
        //        }

        
        
        
        try! realm.write(){
            Mokuhyous!.mokuhyou -= (outputValue ?? 0)
        }
        //桁数をそろえる
        let timeInt = Int(still)
        let s = (timeInt) % 60
        let m = (timeInt - s) / 60 % 3600
        if still > 0 {
        mokuhyoulabel.text = String(format: "%02d:%02d", m,s)
    
        }else{ mokuhyoulabel.text = String("goal")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = self.appdelegate.countNum
     //秒を分に変える
        let timeInt = Int(outputValue!)
        let s = (timeInt) % 60
        let m = (timeInt - s) / 60 % 3600
        nowtimeLabel.text = String(format: "%02d:%02d", m,s)
        
       
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    func read() -> Mokuhyou? {
        return realm.objects(Mokuhyou.self).first
    }
    
    func read() -> Konkai? {
        return realm.objects(Konkai.self).first
    }
    
    
    // label.text = "\(list[pickerView.selectedRow(inComponent: 0)])"
    
    @IBAction func next() {
        
        let newMemo = Konkai()
        newMemo.konkai = outputValue ?? 0
        
        try! realm.write {
            realm.add(newMemo)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
}
