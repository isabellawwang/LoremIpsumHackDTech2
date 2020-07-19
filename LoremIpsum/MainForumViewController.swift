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
        tableView.dataSource = self
        tableView.delegate = self
        ref = Database.database().reference()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        refHandle = ref?.child("Questions").observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? String
            print(snapshot.value)
            
            if let actualPost = post {
                print("Yes")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "QCell", for: indexPath)
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = .byWordWrapping
        cell.textLabel!.font = UIFont.systemFont(ofSize: 14.0)
        cell.textLabel?.text = qData[indexPath.row]
        return cell;
    }
}
