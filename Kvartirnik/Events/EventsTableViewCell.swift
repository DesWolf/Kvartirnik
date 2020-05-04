//
//  EventsTableViewCell.swift
//  Kvartirnik
//
//  Created by Максим Окунеев on 5/2/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

protocol CollectionCellSelectedProtocol: AnyObject {
    func sendDatatoVC(myData: EventModel)
}

class EventsTableViewCell: UITableViewCell {
    
    //Мне стыдно за этот код, в реальной жизни я так не делаю
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var groupName: UILabel!
    
    weak var delegate:CollectionCellSelectedProtocol?
    
    let eventsIntresting = TestData.eventsIntresting
    let eventsCooking = TestData.eventsCooking
    let eventsMusic = TestData.eventsMusic
    let eventsGames = TestData.eventsGames
    let eventsSport = TestData.eventsSport
    let eventsBooks = TestData.eventsBooks
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout.invalidateLayout()
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
        switch collectionView.tag {
        case 0 : return TestData.eventsIntresting.count
        case 1 : return eventsCooking.count
        case 2 : return eventsMusic.count
        case 3 : return eventsGames.count
        case 4 : return eventsSport.count
        case 5 : return eventsBooks.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? EventsCollectionViewCell else { fatalError("Unable to create collectionView cell") }
        
        switch collectionView.tag {
        case 0:
            let element = TestData.eventsIntresting[indexPath.row]
            cell.configere(with: element)
        case 1:
            let element = eventsCooking[indexPath.row]
            cell.configere(with: element)
        case 2:
            let element = eventsMusic[indexPath.row]
            cell.configere(with: element)
        case 3:
            let element = eventsGames[indexPath.row]
            cell.configere(with: element)
        case 4:
            let element = eventsSport[indexPath.row]
            cell.configere(with: element)
        case 5:
            let element = eventsBooks[indexPath.row]
            cell.configere(with: element)
        default:
            cell.eventImage.image = #imageLiteral(resourceName: "photo_2020-04-29_16-16-35")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: 145)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView.tag {
        case 0:
            let element = TestData.eventsIntresting[indexPath.row]
            self.delegate?.sendDatatoVC(myData:element)
        case 1:
            let element = eventsCooking[indexPath.row]
            self.delegate?.sendDatatoVC(myData:element)
        case 2:
            let element = eventsMusic[indexPath.row]
            self.delegate?.sendDatatoVC(myData:element)
        case 3:
            let element = eventsGames[indexPath.row]
            self.delegate?.sendDatatoVC(myData:element)
        case 4:
            let element = eventsSport[indexPath.row]
            self.delegate?.sendDatatoVC(myData:element)
        case 5:
            let element = eventsBooks[indexPath.row]
            self.delegate?.sendDatatoVC(myData:element)
        default:
            return
        }
    }
}
