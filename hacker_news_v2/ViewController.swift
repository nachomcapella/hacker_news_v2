//
//  ViewController.swift
//  hacker_news_v2
//
//  Created by Mariano Martinez on 2/4/18.
//  Copyright © 2018 Nacho Martinez. All rights reserved.
//

import UIKit
import SVProgressHUD
class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var urlProblemLabel: UITextView!
    @IBOutlet weak var webView: UIWebView!
    //var urlString = "google.es"
    var hackerNews: HackerNews?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.delegate = self //Allows for the SVProgressHUD functions to work automatically. We have customized two (startload and finishedload).
        
            if let urlString = hackerNews?.story_url, let url = URL.init(string: urlString){
                webView.loadRequest(URLRequest.init(url: url))
            } else {
                urlProblemLabel.isHidden = false
                urlProblemLabel.text = "Error: webpage not found :("
            }
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

