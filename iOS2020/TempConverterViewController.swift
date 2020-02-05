//
//  TempConverterViewController.swift
//  iOS2020
//
//  Created by Luis Angel Ortega on 04/02/20.
//  Copyright © 2020 Luis Angel Ortega. All rights reserved.
//

import UIKit

class TempConverterViewController: UIViewController {

    @IBOutlet weak var fahrenheitTextField: UITextField!
    @IBOutlet weak var hotCold: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotCold.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showCelsius(_ sender: Any) {
        let fahrenheit = fahrenheitTextField.text!
        let fahrenheitNum = Double(fahrenheit)!
        
        let celius = (fahrenheitNum - 32) / 1.8
        
        let alertController = UIAlertController(title: "In celsius is...", message:
            "\(String(celius))ºC", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay!", style: .default))

        self.present(alertController, animated: true, completion: nil)
        
        hotCold.isHidden = false
        if celius < 10 {
            hotCold.image = UIImage(named: "cold.png")
        } else {
            hotCold.image = UIImage(named: "hot.png")
        }
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
