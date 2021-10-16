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
    //    var number1 = realm.objects(Mokuhyou.self).first
    //    var number2 = Realm.objects(Konkai.self).first
    
    
    var outputValue : TimeInterval?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let memo: Mokuhyou? = read()
        let neko: Konkai? = read()
        still = Double(Mokuhyous!.mokuhyou - (outputValue ?? 0))
        //        }
        
        try! realm.write(Mokuhyous!.mokuhyou)
        //桁数をそろえる
        let timeInt = Int(still)
        let s = (timeInt) % 60
        let m = (timeInt - s) / 60 % 3600
        mokuhyoulabel.text = String(format: "%02d:%02d", m,s)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = self.appdelegate.countNum
     //秒を分に変える
        let timeInt = Int(outputValue!)
        let s = (timeInt) % 60
        let m = (timeInt - s) / 60 % 3600
        nowtimeLabel.text = String(format: "%02d:%02d", m,s)
        
        //            self.nowtime.text = String(self.appdelegate.count)
        
        //         count = saveData.object(forKey: "time")
        //        label.text = String(count)
        
        // Do any additional setup after loading the view.
        
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
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
