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
    
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var downloadPro: UILabel!
    @IBOutlet weak var 下载状态: UILabel!
    //    public lazy var downloader: GXDownloading = {
//        let downloader = GXDownloader()
//        downloader.delegate = self
//        return downloader
//    }()
    
    lazy var downloader: GXTaskDownloadDisk = {
        let task = GXTaskDownloadDisk()
//        downloader.delegate = self
        return task
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        checkDownStatus()
    }

    var downloadURL: String {
        return "https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4"
    }
    //检测URL下载是否完毕，URL文件大小
    
    //检测下载状态
    func checkDownStatus()  {
        
        let b = downloader.diskFile.checkUrlTask(url: downloadURL)
        let status = if b
        { "已下载" }
        else { "未下载" }
        下载状态.text = status
    }
    
    @IBAction func 开始下载(_ sender: UIButton) {
        
        if sender.isSelected {
            //暂停下载
//            downloader.pause()
            return
        }
        
        //开始下载
        downloader.start(forURL: downloadURL) { progress, state in
            
            switch state {
            case .completed:
                
                print("文件下载完毕")
                DispatchQueue.main.async {
                    self.downloadBtn.isSelected = false
                    self.下载状态.text = "已下载"
                }
                
            case .started:
                
                print("准备下载")
                DispatchQueue.main.async {
                    self.下载状态.text = "下载中"
                }
                sender.isSelected = !sender.isSelected

            case .paused:
                print("paused")
            case .notStarted:
                print("notStarted")
            case .stopped:
                print("stopped")
            case .downloading:
                DispatchQueue.main.async {
                    self.downloadPro.text = "下载进度:\(progress)"
                    self.progress.progress = progress
                }
            }
        }
//        downloader.initDownloadUrl(downloadURl)
//        downloader.startDownloading()
        
    }
    
    @IBAction func 移除下载(_ sender: Any) {
        let b = downloader.diskFile.checkUrlTask(url: downloadURL)
        
        if b {
            downloader.diskFile.clearFile(forUrl: downloadURL)
        } else {
            print("不存在")
        }
        
        self.downloadPro.text = "下载进度0.0"
        self.progress.progress = 0
        下载状态.text = "未下载"
        downloadBtn.isSelected = false
    }
    
    @IBAction func 移除所有下载(_ sender: Any) {
        downloader.diskFile.clearAllFile()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

