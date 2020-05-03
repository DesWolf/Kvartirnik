//
//  EventsTableViewCell.swift
//  Kvartirnik
//
//  Created by Максим Окунеев on 5/2/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var groupName: UILabel!
    
    var events = [EventModel(id: 1, eventDate: "3.05.20", eventOwner: "Max Okuneev", eventDescription: "Очистим наши парк вместе!", eventImage: "1"),
                  EventModel(id: 2, eventDate: "4.05.20", eventOwner: "Egor Cabagre", eventDescription: "Квасим капусту!", eventImage: "2"),
                  EventModel(id: 3, eventDate: "4.05.20", eventOwner: "Mari", eventDescription: "Мафия", eventImage: "3"),
                  EventModel(id: 4, eventDate: "5.05.20", eventOwner: "Bob Stroitel", eventDescription: "Играем в слова, онлайн", eventImage: "4"),
                  EventModel(id: 5, eventDate: "7.05.20", eventOwner: "Kuzma Prutkov", eventDescription: "Встречи на французском", eventImage: "5")]
//        ["Очистим наши парк вместе!", "Квасим капусту!","Джемим каждую суботу","Новая книга Глуховского. Обсуждаем","Мафия","Играем в слова, онлайн", "Встречи на французском"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with category: CategoryModel) {
        self.groupName.text = category.type
    }

}

extension EventsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? EventsCollectionViewCell else { fatalError("Unable to create collectionView cell") }
        
        let event = events[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: 126)
    }
    
}
