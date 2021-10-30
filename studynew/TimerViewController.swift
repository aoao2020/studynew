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
        
        
        
    }
   
 
    
    
    
    @objc func up() {
        
       
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
        
  }
    
    @IBAction func start() {
        
        if !timer.isValid {
            //タイマーが動いていなかったら動かす。
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self, selector: #selector(self.up), userInfo: nil, repeats: true )
        }


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





