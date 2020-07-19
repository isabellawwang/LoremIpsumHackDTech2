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
    
   
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var bttn: UIButton!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var tView: UITableView!
    
    @IBAction func buttonClicked(_ sender: Any) {
        let channelRef = ref?.child("Posts").childByAutoId()
                let channelItem = [
                    "answer": text.text,
                    "userid": globalUsername] as [String : Any]
                channelRef?.setValue(channelItem)

                //find the user by the user name
                //with the answer they give, put their username
            }
            var question = "";
            var postData = [String]()
            var nameData = [String]()
            var ref: DatabaseReference?
            var refHandle:DatabaseHandle?
            override func viewDidLoad() {
                super.viewDidLoad()
                bttn.layer.cornerRadius = 10
                bttn.clipsToBounds = true
                questionLabel.text = question

                
                tView.dataSource = self
                tView.delegate = self
                ref = Database.database().reference()

                //read
                refHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
                    let post = snapshot.value! as? [String:String]
                    for (key,value) in post! {
                        if(key=="answer") {
                            self.postData.append(value)
                        } else if (key=="userid") {
                            self.nameData.append(value)
                        }
                        
                    }
                    
                    self.tView.reloadData()
                    

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
                 let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! answerCell
                 cell.textLabel!.numberOfLines = 0
                 cell.textLabel!.lineBreakMode = .byWordWrapping
                 cell.textLabel!.font = UIFont.systemFont(ofSize: 20.0)
                 cell.textLabel?.text = postData[indexPath.row]
                cell.lbl.text = nameData[indexPath.row]

        //         cell.layer.masksToBounds = true
        //         cell.layer.cornerRadius = 5
        //         cell.layer.borderWidth = 2
        //         cell.layer.shadowOffset = CGSize(width: -1, height: 1)
                 
                 return cell;
                 
             }
            

        }

    class answerCell: UITableViewCell {
 

        @IBOutlet weak var lbl: UILabel!
        
        override func awakeFromNib() {
            lbl.text = globalUsername
            super.awakeFromNib()
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath)
                
                 

        //         cell.layer.masksToBounds = true
        //         cell.layer.cornerRadius = 5
        //         cell.layer.borderWidth = 2
        //         cell.layer.shadowOffset = CGSize(width: -1, height: 1)
                 
                 return cell;
                 
             }
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }
