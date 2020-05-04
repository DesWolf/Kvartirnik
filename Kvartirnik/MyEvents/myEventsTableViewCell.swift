//
//  myEventsTableViewCell.swift
//  Kvartirnik
//
//  Created by Максим Окунеев on 5/4/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class myEventsTableViewCell: UITableViewCell {

    @IBOutlet var eventImage: UIImageView!
    @IBOutlet var eventDescription: UILabel!
    @IBOutlet var eventDate: UILabel!
    @IBOutlet var eventOwner: UILabel!
    
    func configere(with event: EventModel) {
        self.eventDate.text = event.eventDate
        self.eventOwner.text = event.eventOwner
        self.eventDescription.text = event.eventName
        if event.eventImage != "" {
        self.eventImage.image = UIImage(named: "\(event.eventImage ?? "")")
        } else {
            self.eventImage.image = standartImage(name: event.category)
        }
    }
        
func standartImage(name: String)-> UIImage {
    switch name {
    case "Кулинария":
        return UIImage(named: "cockingStandartImage")!
    case "Музыка":
        return UIImage(named: "musicStandatImage")!
    case "Игры":
        return UIImage(named: "gamesStandartImage")!
    case "Спорт":
        return UIImage(named: "sportStandartImage")!
    case "Книги":
        return UIImage(named: "booksStandartImage")!
    default:
        return #imageLiteral(resourceName: "intrestingStandatImage")
    }
}
}
