//
//  ViewController.swift
//  RESTfulAPI_SAMPLE1
//
//  Created by Brian Moriguchi on 12/28/19.
//  Copyright © 2019 Brian Moriguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var restLabel: UILabel!
    var content:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://api.randomuser.me/"
        let request: URLRequest = URLRequest(url: URL(string: urlString)!)
   
        // Without Completion handler Either one works
        URLSession.shared.dataTask(with: request) {
               (data: Data?, response: URLResponse?, error: Error?) in
               
            do {
            
                let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                // Get the results of array and phone and email
                if let resultsArray = json.object(forKey: "results") as? NSArray {
                    let resultlDictionary: NSDictionary = resultsArray[0] as! NSDictionary
                    // GEt a value from the dictionary
                    if let email = resultlDictionary["email"] {
                        print("email is \(email)")
                       
                    }
                    if let phone = resultlDictionary["phone"] {
                        print("phone is \(phone)")
                        
                    }
                }
                   
            } catch {
               print("Error")
            }
        }.resume()
        
        // With completion handler
//        URLSession.shared.dataTask(with: request, completionHandler:  {
//            (data: Data?, response: URLResponse?, error: Error?) in
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
//                print(json)
//
//                //restLabel.text = String(json)
//
//            } catch {
//                print("Error")
//            }
//            }).resume()
//
    }
}
