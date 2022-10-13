//
//  Data.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 07.06.2022.
//

import UIKit

struct Data: Equatable,Hashable {
    var title: String
    var secondTitle: String
    var image: UIImage
}

// MARK: - Создание данных для ячеек секции Мои альбомы

let myAlbumsOneCell = Data(title: "Недавние", secondTitle: "4 631", image: UIImage(named: "Woman2")!)
let myAlbumsTwoCell = Data(title: "WhatsApp", secondTitle: "1 027", image: UIImage(named: "Pickels")!)
let myAlbumsThreeCell = Data(title: "Избарнное", secondTitle: "999", image: UIImage(named: "Thai")!)
let myAlbumsFourCell = Data(title: "Telegram", secondTitle: "2 567", image: UIImage(named: "Eva")!)
let myAlbumsFiveCell = Data(title: "Dogs", secondTitle: "666", image: UIImage(named: "Dog")!)
let myAlbumsSixCell = Data(title: "Photos", secondTitle: "125", image: UIImage(named: "Woman1")!)
let myAlbumsSevenCell = Data(title: "Animals", secondTitle: "567", image: UIImage(named: "Tulen")!)
let myAlbumsEightCell = Data(title: "Cars", secondTitle: "911", image: UIImage(named: "Porsche")!)

//MARK: -  Создание дннаых для ячеек секции Общие альбомы

let sharedAlbunsOneCell = Data(title: "Путешествия", secondTitle: "5 699", image: UIImage(named: "Trip")!)
let sharedAlbunsTwoCell = Data(title: "Семейные", secondTitle: "7 894", image: UIImage(named: "Family")!)
let sharedAlbunsThreeCell = Data(title: "Работа", secondTitle: "1 023", image: UIImage(named: "Work")!)
let sharedAlbunsFourCell = Data(title: "Мемы", secondTitle: "9 999", image: UIImage(named: "Memes")!)

// MARK: - Создание данных для ячеек секции Типы медиафайлов

let typeOfMediaOneCell = Data(title: "Видео", secondTitle: "930", image: UIImage(systemName: "video")!)
let typeOfMediaTwoCell = Data(title: "Селфи", secondTitle: "31", image: UIImage(systemName: "person.crop.square")!)
let typeOfMediaThreeCell = Data(title: "Фото Live Photos", secondTitle: "32", image: UIImage(named: "LifePhotos")!)
let typeOfMediaFourCell = Data(title: "Портреты", secondTitle: "10", image: UIImage(named: "Portraits")!)
let typeOfMediaFiveCell = Data(title: "Замедленно", secondTitle: "10", image: UIImage(named: "Slowmotion")!)
let typeOfMediaSixCell = Data(title: "Снимки экрана", secondTitle: "136", image: UIImage(named: "ScrennShot")!)
let typeOfMediaSevenCell = Data(title: "Записи экрана", secondTitle: "7", image: UIImage(named: "ScreenRecord")!)

// MARK: - Создание данных для ячеек секции Дургое

let otherOneCell = Data(title: "Импортированные", secondTitle: "6", image: UIImage(named: "Import")!)
let otherTwoCell = Data(title: "Скрытые", secondTitle: "0", image: UIImage(named: "Hide")!)
let otherThreeCell = Data(title: "Недавно удаленные", secondTitle: "11", image: UIImage(named: "Deleted")!)

//MARK: - Создание структуры SectionData, ее экземлпяров, а также пустого массива

struct SectionData: Equatable, Hashable {
    var type: String
    var data: [Data]
}

let firstSecionType = SectionData(type: "Мои альбомы", data: [myAlbumsOneCell, myAlbumsTwoCell, myAlbumsThreeCell, myAlbumsFourCell, myAlbumsFiveCell, myAlbumsSixCell, myAlbumsSevenCell, myAlbumsEightCell])
let secondSecionType = SectionData(type: "Общие альбомы", data: [sharedAlbunsOneCell, sharedAlbunsTwoCell, sharedAlbunsThreeCell, sharedAlbunsFourCell])
let thirthSecionType = SectionData(type: "Типы медиафайлов", data: [typeOfMediaOneCell, typeOfMediaTwoCell, typeOfMediaThreeCell, typeOfMediaFourCell, typeOfMediaFiveCell, typeOfMediaSixCell, typeOfMediaSevenCell])
let fourSecionType = SectionData(type: "Другое", data: [otherOneCell,otherTwoCell, otherThreeCell])

var sectionData = [SectionData]()

