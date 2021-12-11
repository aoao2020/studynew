//
//  Memo.swift
//  studynew
//
//  Created by アオイ on 2021/05/08.
//

import Foundation
import RealmSwift

class Mokuhyou: Object {
    @objc dynamic var mokuhyou: TimeInterval = 0
    @objc dynamic var date: Date?
    @objc dynamic var from0to4: Float = 0
    @objc dynamic var from4to8: Float = 0
    @objc dynamic var from8to12: Float = 0
    @objc dynamic var from12to16: Float = 0
    @objc dynamic var from16to20: Float = 0
    @objc dynamic var from20to24: Float = 0

}

class Konkai: Object {
    @objc dynamic var konkai: TimeInterval = 0
}
