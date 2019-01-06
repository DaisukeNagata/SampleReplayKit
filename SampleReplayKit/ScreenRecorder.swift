//
//  ScreenRecorder.swift
//  SampleReplayKit
//
//  Created by 永田大祐 on 2019/01/06.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import ReplayKit

class ScreenRecorder:NSObject,RPPreviewViewControllerDelegate {

    private var vc: UIViewController

    init(vc: UIViewController) {
        self.vc = vc
    }

    var recorder: RPScreenRecorder = {
        let recorder = RPScreenRecorder.shared()
         recorder.isMicrophoneEnabled = true
        return recorder
    }()
    @objc func startRecording(){
        recorder.startRecording { (error) in
            guard error == nil else {
                return
            }
        }
    }
    @objc func stopRecording(){
        recorder.stopRecording { (preview, error) in
            guard preview == nil else {
                preview?.previewControllerDelegate = self
                self.vc.present(preview!, animated: true)
                return
            }
        }
    }
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        vc.dismiss(animated: true)
    }
}
