//
//  PromptViewController.swift
//  LoremIpsum
//
//  Created by Bilge Tatar on 7/19/20.
//  Copyright © 2020 Bilge Tatar. All rights reserved.
//

import UIKit

class PromptViewController: UIViewController {

    @IBOutlet weak var prompt: UILabel!
    
    
    override func viewDidLoad() {
        let randomInt = Int.random(in: 1..<5)
        if (randomInt==1) {
            prompt.text = ""
        } else if (randomInt == 2) {
            prompt.text = ""
        }else if (randomInt == 3) {
            prompt.text = ""
        }else if (randomInt == 4) {
            prompt.text = ""
        }else if (randomInt == 5) {
            prompt.text = ""
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
