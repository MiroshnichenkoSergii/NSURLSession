//
//  ViewController.swift
//  NSURLSession
//
//  Created by Sergii Miroshnichenko on 01.11.2022.
//

import UIKit
import WebKit
import Kanna

class ViewController: UIViewController {

    @IBOutlet var myWebView: WKWebView!
    
    let myURLAdress = "http://www.google.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayURL()
    }
    
    // Review for displayURL method
    func displayURL() {
        guard let myURL = NSURL(string: myURLAdress) else { return }

        if let myHTMLString = try? String(contentsOf: myURL as URL, encoding: .ascii) {
            print(myHTMLString)
            
            if let doc = try? HTML(html: myHTMLString, encoding: .utf8) {

                // Search for nodes by XPath
                for link in doc.xpath("//a | //link") {
                    print(link["href"]!)
                }
            }
            
        } else {
            print("Error")
        }

        myWebView.load(URLRequest(url: myURL as URL))
    }
    
    // Try review old variant (it works but without images in load)
//    func displayURL() {
//        let myURLAdress = "http://www.google.com/"
//        let myURL = NSURL(string: myURLAdress)
//        let URLTask = URLSession(configuration: .default).dataTask(with: myURL! as URL) { myData, response, error in
//
//            guard error == nil else { return }
//
//            let myHTMLString = String(data: myData!, encoding: String.Encoding.utf8)
//
//            DispatchQueue.main.async {
//                self.myWebView.loadHTMLString(myHTMLString!, baseURL: nil)
//            }
//
//            print(myHTMLString!)
//        }
//        URLTask.resume()
//    }


}

