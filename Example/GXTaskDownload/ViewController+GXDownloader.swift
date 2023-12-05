//
//  ViewController+GXDownloader.swift
//  GXTaskDownload_Example
//
//  Created by 高广校 on 2023/12/5.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import GXTaskDownload

extension ViewController: GXDownloadingDelegate {
    func download(_ download: GXTaskDownload.GXDownloading, changedState state: GXTaskDownload.GXDownloadingState) {
        print(state)
    }
    
    func download(_ download: GXTaskDownload.GXDownloading, completedWithError error: Error?) {
        
        print(error)
    }
    
    func download(_ download: GXTaskDownload.GXDownloading, didReceiveData data: Data, progress: Float) {
        
        //获取下载进度
        print(progress)
        self.progress.progress = progress
    }
    
}
