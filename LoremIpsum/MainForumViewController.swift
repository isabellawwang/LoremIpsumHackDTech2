//
//  MainForumViewController.swift
//  LoremIpsum
//
//  Created by Bilge Tatar on 7/19/20.
//  Copyright © 2020 Bilge Tatar. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MainForumViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var bttn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func questionClicked(_ sender: Any) {
        ref?.child("Questions").childByAutoId().setValue(textField.text);
    }
    
    var qData = [String]()
    var ref: DatabaseReference?
    var refHandle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bttn.layer.cornerRadius = 10
        bttn.clipsToBounds = true
        tableView.dataSource = self
        tableView.delegate = self
        ref = Database.database().reference()
        

        refHandle = ref?.child("Questions").observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? String
            print(snapshot.value)
            
            if let actualPost = post {
                self.qData.append(actualPost)
                self.tableView.reloadData()
            }
          // ...
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qData.count;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionTableViewCell", for: indexPath)
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = .byWordWrapping
        cell.textLabel!.font = UIFont.systemFont(ofSize: 20.0)
        cell.textLabel?.text = qData[indexPath.row]
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = storyboard?.instantiateViewController(identifier: "ForumViewController") as? ForumViewController
        destVC?.question = qData[indexPath.row]
        self.navigationController?.pushViewController(destVC!, animated: true)
    }
}
