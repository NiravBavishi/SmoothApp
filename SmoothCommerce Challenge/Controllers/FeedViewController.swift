//
//  ViewController.swift
//  SmoothCommerce Challenge
//
//  Created by Nirav Bavishi on 2020-07-22.
//  Copyright © 2020 Nirav Bavishi. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SafariServices
import AVFoundation
import AVKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var feedTableView: UITableView!
    var ref : DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    var results : [responseData] = []
    
      let resultDataa = [
        [
                    "item_type": "text",
                    "data": "Lorem ipsum"
                ],
                [
                    "item_type": "url",
                    "data": "https://material.io/components/"
                ],
                [
                    "item_type": "image",
                    "data": "http://placekitten.com/200/300"
                ],
                [
                    "item_type": "video",
                    "data": "https://devstreaming-cdn.apple.com/videos/wwdc/2017/230lc4n1loob9/230/hls_vod_mvp.m3u8"
                ]
            ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.delegate = self
        feedTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        
        
        getDataFromFirebase()
        
        
        for data in resultDataa{
            
            results.append(responseData(itemType: data["item_type"]!, data: data["data"]!))
            
        }
        
   
    }
    
    private func getDataFromFirebase() {
       
        
        var tempbuff:[[String:String]] = []
        
        ref?.child("data").observe(.value, with: { (snapshot) in
            guard let value = snapshot.value as? [[String:Any]] else {print("Error")
                return
            }
            
            
            var buff = [[String:String]]()
            for tempData in value{
                
                let itemType = tempData["item_type"] as! String
                let data = tempData["data"] as! String
                
                self.results.append(responseData.init(itemType: itemType, data: data))
                   }
        })
    
        print("-----------Data")
        print(results)
        
    }
  
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let itemType = results[indexPath.row].itemType
        let data = results[indexPath.row].data
        
        if itemType == "url"{
            
            let svc = SFSafariViewController(url: URL(string:"http://stackoverflow.com")!)
            self.present(svc, animated: true, completion: nil)
            
        }else if itemType == "video"{
            playVideo(url: data)
        }
    }
    
    private func playVideo(url:String){
        
        guard let url = URL(string: url)else {return}
              let player = AVPlayer(url: url)
              var playerController = AVPlayerViewController()
              playerController.player = player
              playerController.allowsPictureInPicturePlayback = true
              playerController.player?.play()
              self.present(playerController, animated: true, completion: nil)
 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemType = results[indexPath.row].itemType
        let data = results[indexPath.row].data
        
        
        if itemType == "text"{
            
            let cell = (tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! TextTableViewCell)
            cell.setData(textData: data)
                   return cell
            
        }
        else if itemType == "image"{
            
            let cell = (tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell)
            cell.setImage(url: data)
            return cell
            
        }
        else if itemType == "url"{
            
            let cell = (tableView.dequeueReusableCell(withIdentifier: "linkCell", for: indexPath) as! LinkTableViewCell)
            cell.setURL(url: data)
            return cell
            
        }else if itemType == "video"{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! videoTableViewCell
            return cell
            
        }
            
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
            return cell
        }
        
        
        
        
       
            
     
        
    }
    
    


}

