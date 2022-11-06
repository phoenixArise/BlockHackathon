//
//  ResultViewController.swift
//  BlockHackathon
//
//  Created by Brian Seo on 2022-11-06.
//

import UIKit
import Lottie

class ResultViewController: UIViewController {
    var track: Track?
    var car: Car?
    
    @IBOutlet var animationView: LottieAnimationView!
    @IBOutlet var result: UILabel!
    @IBOutlet var points: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        // Do any additional setup after loading the view.
        result.text = Bool.random() ? "Won" : "Lost"
        points.text = "\(Int.random(in: 1...3000))"
        
        points.layer.cornerRadius = 15.0
        points.clipsToBounds = true
       
        animationView.animationSpeed = 0.8
        animationView.loopMode = .loop
        animationView.play()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
