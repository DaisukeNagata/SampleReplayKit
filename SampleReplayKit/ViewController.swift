//
//  ViewController.swift
//  SampleReplayKit
//
//  Created by 永田大祐 on 2019/01/06.
//  Copyright © 2019 永田大祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var statusBar = StatusBarUI().statusBar

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(startRecording))
        navigationController?.navigationBar.addSubview(statusBar)
    }

    @objc func startRecording() {
        ScreenRecorder(vc: self).startRecording()
        statusBarUI(st: "Stop",color: .red, sec: #selector(stopRecording))
    }

    @objc func stopRecording() {
       ScreenRecorder(vc: self).stopRecording()
       statusBarUI(st: "Start",color: .white,sec: #selector(startRecording))
    }

    func statusBarUI(st: String, color: UIColor, sec: Selector){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: st, style: .plain, target: self, action: sec)
        statusBar.backgroundColor = color
    }
}
