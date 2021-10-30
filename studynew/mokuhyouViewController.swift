//
//  mokuhyouViewController.swift
//  studynew
//
//  Created by アオイ on 2021/02/27.
//

import UIKit
import RealmSwift



class mokuhyouViewController: UIViewController, UITextFieldDelegate {
    

    
    @IBOutlet weak var datePicker: UIDatePicker!
    let realm = try! Realm()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
      
      
        datePicker.datePickerMode = .countDownTimer
             
        
        
    }
          
        

        @IBAction func ok() {
            let Mokuhyous = try! Realm().objects(Mokuhyou.self)
            for m in Mokuhyous {
                if    stringFromDate(dat: m.date!, format: "MM/dd") ==  stringFromDate(dat: Date(), format: "MM/dd"){
                    self.presentingViewController?.dismiss(animated: true, completion: nil)
                    return
                }
            }
          
            let newMemo = Mokuhyou()
            newMemo.mokuhyou = datePicker.countDownDuration
            newMemo.date = Date()
            try! realm.write {
                realm.add(newMemo)
            }

            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }


  //カレンダーを取得
    private func stringFromDate(dat: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: dat)
    }
}










    
