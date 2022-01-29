//
//  ChartViewController.swift
//  studynew
//
//  Created by アオイ on 2021/11/27.
//

import UIKit
import Charts
import RealmSwift
class ChartViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    
    let realm = try! Realm()
    let Mokuhyous = try! Realm().objects(Mokuhyou.self)
    var save = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //グラフに表示される値
        let rawData: [Float] = [Mokuhyous[save].from0to4/60, Mokuhyous[save].from4to8/60, Mokuhyous[save].from8to12/60, Mokuhyous[save].from12to16/60, Mokuhyous[save].from16to20/60, Mokuhyous[save].from20to24/60]
        let entries = rawData.enumerated().map { BarChartDataEntry(x: Double($0.offset), y: Double($0.element)) }
        let dataSet = BarChartDataSet(entries: entries)
        let data = BarChartData(dataSet: dataSet)
        barChartView.data = data

        // X軸のラベルの位置を下に設定
        barChartView.xAxis.labelPosition = .bottom
        // X軸のラベルの色を設定
        barChartView.xAxis.labelTextColor = .systemGray
        // X軸の線、グリッドを非表示にする
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawAxisLineEnabled = false
        
        // 右側のY座標軸は非表示にする
        barChartView.rightAxis.enabled = false
        
        // Y座標の値が0始まりになるように設定
        barChartView.leftAxis.axisMinimum = 0.0
        barChartView.leftAxis.axisMaximum = 250
        barChartView.leftAxis.drawZeroLineEnabled = true
        barChartView.leftAxis.zeroLineColor = .systemGray
        // ラベルの数を設定
        barChartView.leftAxis.labelCount = 5
        // ラベルの色を設定
        barChartView.leftAxis.labelTextColor = .systemGray
        // グリッドの色を設定
        barChartView.leftAxis.gridColor = .systemGray
        // 軸線は非表示にする
        barChartView.leftAxis.drawAxisLineEnabled = false
        
        barChartView.legend.enabled = false
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter (values: ["0-4","4-8","8-12","12-16","16-20","20-24"])
       
        dataSet.drawValuesEnabled = false
        //グラフの色が青色
        dataSet.colors = [UIColor(red: 0.35, green: 0.73, blue: 0.76, alpha: 1.0)]
    
    }
    
    
    
    // Do any additional setup after loading the view.
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
//    class ChartFormatter: NSObject, IAxisValueFormatter {
//           let rawData = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
//
//           func stringForValue(_ value: Double, axis: AxisBase?) -> String {
//
//               let index = Int(value)
//               return rawData[index]
//           }
//
//       }
}
