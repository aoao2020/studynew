//
//  mokuhyouViewController.swift
//  studynew
//
//  Created by アオイ on 2021/02/27.
//

import UIKit
import RealmSwift



class mokuhyouViewController: UIViewController, UITextFieldDelegate {
    
//    @IBOutlet var mokuhyoutextField: UITextField!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    let realm = try! Realm()
    
    
//       var pickerView: UIPickerView = UIPickerView()
//       let list: [String] = ["10", "30", "60", "90", "120", "150", "180", "200", "240", "300", "360", "420", "480"]
//
    override func viewDidLoad() {
        super.viewDidLoad()
        // ピッカー設定
//              pickerView.delegate = self
//              pickerView.dataSource = self
//              pickerView.showsSelectionIndicator = true
//
              // 決定バーの生成
//              let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
//              let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//              let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
//              toolbar.setItems([spacelItem, doneItem], animated: true)
//
      
        datePicker.datePickerMode = .countDownTimer
             
        
        // インプットビュー設定
//        mokuhyoutextField.inputView = pickerView
//        mokuhyoutextField.inputAccessoryView = toolbar
    }
          
          // 決定ボタン押下
//          @objc func done() {
//            mokuhyoutextField.endEditing(true)
//            mokuhyoutextField.text = "\(list[pickerView.selectedRow(inComponent: 0)])"
//
//           }
//}
//        // Do any additional setup after loading the view.
//
//    extension mokuhyouViewController : UIPickerViewDelegate, UIPickerViewDataSource {
//
//        // ドラムロールの列数
//        func numberOfComponents(in pickerView: UIPickerView) -> Int {
//            return 1
//        }
//        // ドラムロールの行数
//           func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//               /*
//                列が複数ある場合は
//                if component == 0 {
//                } else {
//                ...
//                }
//                こんな感じで分岐が可能
//                */
//               return list.count
//           }
//        // ドラムロールの各タイトル
//           func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//               /*
//                列が複数ある場合は
//                if component == 0 {
//                } else {
//                ...
//                }
//                こんな感じで分岐が可能
//                */
//               return list[row]
//           }
//
        @IBAction func ok() {

            let newMemo = Mokuhyou()
            newMemo.mokuhyou = datePicker.countDownDuration
            try! realm.write {
                realm.add(newMemo)
            }

            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
//
//
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}









    
