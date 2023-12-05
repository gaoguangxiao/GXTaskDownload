//
//  ViewController.swift
//  GXTaskDownload
//
//  Created by 小修 on 12/05/2023.
//  Copyright (c) 2023 小修. All rights reserved.
//

import UIKit
import GXTaskDownload

class ViewController: UIViewController {

    @IBOutlet weak var progress: UIProgressView!
    
    public lazy var downloader: GXDownloading = {
        let downloader = GXDownloader()
        downloader.delegate = self
        return downloader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let url = URL(string: "http://localhost:8081/static/music-Loop.mp3") {
            downloader.url = url
        }
    }

    @IBAction func 开始下载(_ sender: Any) {
        
        downloader.start()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

