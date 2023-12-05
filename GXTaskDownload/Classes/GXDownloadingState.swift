//
//  GXDownloadingState.swift
//  GXTaskDownload
//
//  Created by 高广校 on 2023/12/5.
//

import Foundation

/// The various states of a download request.
///
/// - completed: The download has completed
/// - started: The download has yet to start
/// - paused: The download is paused
/// - notStarted: The download has not started yet
/// - stopped: The download has been stopped/cancelled
public enum GXDownloadingState: String {
    case completed
    case started
    case paused
    case notStarted
    case stopped
}
