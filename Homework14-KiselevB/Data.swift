//
//  Data.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 07.06.2022.
//

import UIKit

struct Data {
    var title: String
    var secondTitle: String
    var image: UIImage?
}

var dataForCell = [Data]()

let womanFirst = Data(title: "Женщины печальные", secondTitle: "5", image: UIImage(named: "Wooman1"))

let womanTwo = Data(title: "Женщины красивые", secondTitle: "886", image: UIImage(named: "Wooman2"))

let tulen = Data(title: "Тюлени", secondTitle: "666", image: UIImage(named: "Tulen"))

let dogs = Data(title: "Пёсели", secondTitle: "1999", image: UIImage(named: "Dog"))

let kinder = Data(title: "Дети", secondTitle: "899", image: UIImage(named: "Kinder"))
