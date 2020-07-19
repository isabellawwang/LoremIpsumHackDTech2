//
//  ForumViewController.swift
//  LoremIpsum
//
//  Created by Brianna Butler on 7/18/20.
//  Copyright © 2020 Bilge Tatar. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ForumViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var tView: UITableView!
    
    @IBAction func buttonClicked(_ sender: Any) {
        ref?.child("Posts").childByAutoId().setValue(text.text);
    }
    
    var postData = [String]()
    var ref: DatabaseReference?
    var refHandle:DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tView.separatorStyle = UITableViewCell.SeparatorStyle.none

        
        tView.dataSource = self
        tView.delegate = self
        ref = Database.database().reference()

        refHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? String
            print(snapshot.value)
            
            if let actualPost = post {
                print("Yes")
                self.postData.append(actualPost)
                self.tView.reloadData()
            }
          // ...
        })
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
         return postData.count;
     }
     
     func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 1;
     }
     
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 5;
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
         cell.textLabel!.numberOfLines = 0
         cell.textLabel!.lineBreakMode = .byWordWrapping
         cell.textLabel!.font = UIFont.systemFont(ofSize: 14.0)
         cell.textLabel?.text = postData[indexPath.row]
         cell.layer.masksToBounds = true
         cell.layer.cornerRadius = 5
         cell.layer.borderWidth = 2
         cell.layer.shadowOffset = CGSize(width: -1, height: 1)
         
         return cell;
         
     }
}
