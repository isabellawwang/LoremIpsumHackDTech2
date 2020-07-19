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
    
    @IBAction func buttonClicked(_ sender: Any) {
        let randomInt = Int.random(in: 1..<5)
        if (randomInt==1) {
            prompt.text = "Recognize your stereotypic responses within society, label them, and replace them with non-stereotypic responses."
        } else if (randomInt == 2) {
            prompt.text = "Imagine an example of a member of an out-group who counters popularly held stereotypes."
        }else if (randomInt == 3) {
            prompt.text = "View individuals according to their personal, rather than stereotypical characteristics"
        }else if (randomInt == 4) {
            prompt.text = "Adopt the perspective in the first person of a member of a stigmatized group."
        }else if (randomInt == 5) {
            prompt.text = "Have you recently attempted to increase your exposure to out-group members?"
        }
    }
    
    override func viewDidLoad() {
        let randomInt = Int.random(in: 1..<5)
        if (randomInt==1) {
            prompt.text = "Recognize your stereotypic responses within society, label them, and replace them with non-stereotypic responses."
        } else if (randomInt == 2) {
            prompt.text = "Imagine an example of a member of an out-group who counters popularly held stereotypes."
        }else if (randomInt == 3) {
            prompt.text = "View individuals according to their personal, rather than stereotypical characteristics"
        }else if (randomInt == 4) {
            prompt.text = "Adopt the perspective in the first person of a member of a stigmatized group."
        }else if (randomInt == 5) {
            prompt.text = "Have you recently attempted to increase your exposure to out-group members?"
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
