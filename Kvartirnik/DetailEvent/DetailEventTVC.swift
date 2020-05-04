//
//  DetailEventTVC.swift
//  Kvartirnik
//
//  Created by Максим Окунеев on 5/4/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class DetailEventTVC: UITableViewController {
    
    // Мне стыдно за этот код, но времени было очень мало!
    
    @IBOutlet var eventImage: UIImageView!
    @IBOutlet var eventName: UILabel!
    @IBOutlet var ownerName: UILabel!
    @IBOutlet var eventDescription: UILabel!
    @IBOutlet var eventDate: UILabel!
    @IBOutlet var joinButton: UIButton!
    @IBOutlet var editButton: UIBarButtonItem!
    
    var eventLink: String = ""
    
    var event = EventModel(id: 1, category: "", eventDate: "", eventOwner: "", eventName: "", eventDescription: "", eventLink: "", eventPrice: "", eventImage: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScreen()
    }
    
    func setScreen() {
        eventName.text = event.eventName
        ownerName.text = event.eventOwner
        eventDescription.text = event.eventDescription
        eventDate.text = event.eventDate
        
        if event.eventOwner == "Max Okuneev" {
            if event.eventImage == "" {
                eventImage.image = standartImage(name: event.category)
            } else {
                eventImage.image = UIImage(named: event.eventImage ?? "")
            }
            joinButton.setTitle("Отправить ссылку!", for: .normal) 
            joinButton.setTitleColor(.white, for: .normal)
            joinButton.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 90/256, green: 200/256, blue: 250/256, alpha: 1))
        } else {
            eventImage.image = UIImage(named: event.eventImage ?? "")
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    @IBAction func JoinButton(_ sender: Any) {
    }
}

extension DetailEventTVC {
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
