//
//  Home1ViewController.swift
//  studynew
//
//  Created by アオイ on 2021/02/27.
//

import UIKit

class Home1ViewController: UIViewController {
    
    @IBOutlet var mm :UIButton!
    @IBOutlet var ti :UIButton!
    @IBOutlet var gl :UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       mm.layer.cornerRadius = 20
        ti.layer.cornerRadius = 20
        gl.layer.cornerRadius = 20

        // Do any additional setup after loading the view.
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
