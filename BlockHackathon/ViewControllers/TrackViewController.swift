//
//  TrackViewController.swift
//  BlockHackathon
//
//  Created by Brian Seo on 2022-11-06.
//

import UIKit

class TrackViewController: UIViewController {
    @IBOutlet var trackCollectionView: UICollectionView!
    @IBOutlet var nextButton: UIButton!
    
    let backgroundColor = {
        (isSelected: Bool) -> UIColor in
        return isSelected ? .purple : .systemPink
    }
    
    var selected: IndexPath? = nil {
        didSet {
            if let _ = selected {
                nextButton.isEnabled = true;
            } else {
                nextButton.isEnabled = false;
            }
        }
    }
    
    let tracks = {
        [
            Track(weatherCondition: .clear, numberOfCorners: 15, maximumLengthOfStraightRoad: 123151, roadSurfaceCondition: .dry),
            Track(weatherCondition: .rain, numberOfCorners: 314, maximumLengthOfStraightRoad: 13215, roadSurfaceCondition: .wet),
            Track(weatherCondition: .cloudy, numberOfCorners: 5555, maximumLengthOfStraightRoad: 3321, roadSurfaceCondition: .dry),
            Track(weatherCondition: .snow, numberOfCorners: 0, maximumLengthOfStraightRoad: 5001123, roadSurfaceCondition: .wet),
            Track(weatherCondition: .snow, numberOfCorners: 32, maximumLengthOfStraightRoad: 131515123, roadSurfaceCondition: .dry),
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        trackCollectionView.dataSource = self
        trackCollectionView.delegate = self
        
        trackCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "TrackCell")
        selected = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? ConditionsViewController {
            if let selected = selected {
                vc.track = tracks[selected.row]
            }
        }
    }
}

extension TrackViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let track = tracks[indexPath.row]
        let cell = trackCollectionView.dequeueReusableCell(withReuseIdentifier: "TrackCell", for: indexPath)
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: 50))
        title.text = "\(indexPath.row)"
        title.font = UIFont(name: "AvenirNext-Bold", size: 15)
        title.textAlignment = .center
        
        
        cell.contentView.addSubview(title)
        cell.layer.cornerRadius = 15.0
        cell.clipsToBounds = true
        cell.backgroundColor = backgroundColor(false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selected = selected {
            let selectedCell = trackCollectionView.cellForItem(at: selected)
            selectedCell?.backgroundColor = backgroundColor(false)
        }
        selected = indexPath
        let selectedCell = trackCollectionView.cellForItem(at: indexPath)
        selectedCell?.backgroundColor = backgroundColor(true)
    }
}
