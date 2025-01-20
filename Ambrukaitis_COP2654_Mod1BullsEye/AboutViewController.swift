//
//  AboutViewController.swift
//  Ambrukaitis_COP2654_Mod1BullsEye
//
//  Created by Matas Ambrukaitis on 1/19/25.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    //button to return the user to the main game, the transition is animated
    @IBAction func returnToGame() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loads the HTML file into the WebKit view
        if let url = Bundle.main.url(
            forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
