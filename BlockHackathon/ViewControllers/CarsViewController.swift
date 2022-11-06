//
//  CarsViewController.swift
//  BlockHackathon
//
//  Created by Brian Seo on 2022-11-06.
//

import UIKit

struct Car {
    let horsePower: Int
    let brakePad: Int
    let windResistence: Int
}

class CarsViewController: UIViewController {
    var track: Track?
    
    @IBOutlet var carsCollectionView: UICollectionView!
    
    @IBOutlet var selectedCarImageView: UIImageView!
    
    var selected: IndexPath? = nil
    
    let colors = [
        UIColor.systemPink,
        UIColor.orange,
        UIColor.purple,
        UIColor.red,
        UIColor.yellow,
        UIColor.cyan,
    ]
    
    let cars = [
        Car(horsePower: 320, brakePad: 111, windResistence: 32),
        Car(horsePower: 450, brakePad: 333, windResistence: 13),
        Car(horsePower: 510, brakePad: 155, windResistence: 23),
        Car(horsePower: 200, brakePad: 141, windResistence: 63),
        Car(horsePower: 140, brakePad: 132, windResistence: 96),
        Car(horsePower: 130, brakePad: 558, windResistence: 31),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carsCollectionView.delegate = self
        carsCollectionView.dataSource = self
        
        carsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CarCell")
        
        selected = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? ResultViewController {
            if let selected = selected {
                vc.car = cars[selected.row]
            }
            vc.track = track
        }
    }
}

extension CarsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carsCollectionView.dequeueReusableCell(withReuseIdentifier: "CarCell", for: indexPath)
        
        let carImage = UIImage(systemName: "car")
        let carImageHighlighted = UIImage(systemName: "car.circle")
        
        let carImageView = UIImageView(image: carImage, highlightedImage: carImageHighlighted)
        carImageView.tintColor = colors[indexPath.row]
//        carImageView.backgroundColor = colors[indexPath.row]
        
        cell.contentView.addSubview(carImageView)
        cell.layer.cornerRadius = 15.0
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let carImage = UIImage(systemName: "car")
        selectedCarImageView.image = carImage
        selectedCarImageView.tintColor = colors[indexPath.row]
        
        selected = indexPath
    }
}
