//
//  ConditionsViewController.swift
//  BlockHackathon
//
//  Created by Brian Seo on 2022-11-06.
//

import UIKit

class ConditionsViewController: UIViewController {
    
    @IBOutlet var weatherCondition: UILabel!
    
    @IBOutlet var numberOfCorners: UILabel!
    @IBOutlet var maximumLengthOfStraightRoad: UILabel!
    @IBOutlet var surface: UILabel!
    
    var track : Track?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        // Do any additional setup after loading the view.
        
        weatherCondition.layer.cornerRadius = 15.0
        numberOfCorners.layer.cornerRadius = 15.0
        maximumLengthOfStraightRoad.layer.cornerRadius = 15.0
        surface.layer.cornerRadius = 15.0
        
        weatherCondition?.text = track?.weatherCondition.rawValue
        if let numofCorners = track?.numberOfCorners {
            numberOfCorners?.text = "\(numofCorners)"
        }
        if let maxLengthStraight = track?.maximumLengthOfStraightRoad {
            maximumLengthOfStraightRoad.text = "\(maxLengthStraight)"
        }
        
        if let surfaceCondition = track?.roadSurfaceCondition {
            surface?.text = "\(surfaceCondition)"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? CarsViewController {
            if let track = track {
                vc.track = track
            }
        }
    }
}
