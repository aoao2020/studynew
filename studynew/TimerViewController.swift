//
//  ViewController.swift
//  studynew
//
//  Created by アオイ on 2021/02/13.
//

import UIKit

class TimerViewController: UIViewController {
    var timerRunning = false
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    //    @IBOutlet var label: UILabel!
    var saveData: UserDefaults = UserDefaults.standard
    @IBOutlet var jikan: UILabel!
    //var saveDate: UserDefaults = UserDefaults.standard
    
    
    //    var count: Float = 0.0
    var count: TimeInterval = 0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        saveData.set(count, forKey: "time")
        
        //        count = saveData.float(forKey: "time")
        //        label.text = String(count)
        //            jikan.text = saveDate.object(forKey: "content") as? String
     
        
    }
   
 
    
    
    
    @objc func up() {
        
        //   if count > 0 {
        
        //            let hours = count / 3600
        //
        //            let minutes = count / 60
        //
        //            let seconds = count / 60
        
        count += 0.01
        
        let timeInt = Int(count)
        let s = (timeInt) % 60
        let m = (timeInt - s) / 60 % 3600
        print(timeInt)
        print(s, m)
        
//        count = count + 1
        
        
//        jikan.text = String(format: "%02d:%02d.%02d", m,s,ms)
        jikan.text = String(format: "%02d:%02d", m,s)
//        jikan.text = String(count)
        print(type(of: count))
        print(Int(count)) // 3.0 (四捨五入)
        
//        jikan.text = String(count)
        
        //            jikan.text = "\(hours):\(minutes):\(seconds)"
        
        //   }
        
        //countを0.01たす
        //        count = count + 0.01
        //ラベルに小数点以下２桁まで表示
//        jikan.text = String(format: "%.2f", count)
    }
    
    @IBAction func start() {
        
        if !timer.isValid {
            //タイマーが動いていなかったら動かす。
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self, selector: #selector(self.up), userInfo: nil, repeats: true )
        }
//        if timerRunning == false{
//                   timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
//                   timerRunning = true
//               }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueのIDを確認して特定のsegueのときのみ動作させる
            if segue.identifier == "tokekkaViewController" {
                // 2. 遷移先のViewControllerを取得
                let next = segue.destination as? kekkaViewController
                // 3. １で用意した遷移先の変数に値を渡す
                next?.outputValue = self.count
                print(count)
            }
        }
    
    
     @IBAction func end() {
        if timer.isValid {
            //timerstop
            timer.invalidate()
       }
        appdelegate.countNum = Int(count)
    }
}





