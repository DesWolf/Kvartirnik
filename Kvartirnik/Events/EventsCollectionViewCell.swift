//
//  CollectionViewCell.swift
//  Kvartirnik
//
//  Created by Максим Окунеев on 5/3/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var eventDate: UILabel!
    @IBOutlet var eventOwner: UILabel!
    @IBOutlet var eventDescription: UILabel!
    @IBOutlet var eventImage: UIImageView!
    

    
    func configere(with category: EventModel) {
        self.eventDescription.text = category.eventDate
    }
}
