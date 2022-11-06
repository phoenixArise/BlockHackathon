//
//  ResultViewController.swift
//  BlockHackathon
//
//  Created by Brian Seo on 2022-11-06.
//

import UIKit

class ResultViewController: UIViewController {
    var track: Track?
    var car: Car?
    
    @IBOutlet var result: UILabel!
    @IBOutlet var points: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        // Do any additional setup after loading the view.
        result.text = Bool.random() ? "Won" : "Lost"
        points.text = "\(Int.random(in: 1...3000))"
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
