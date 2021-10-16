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
}

class Konkai: Object {
    @objc dynamic var konkai: TimeInterval = 0
}
