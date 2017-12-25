//
//  LoadingTimelineViewController.swift
//  HDRosaryTimeline_Example
//
//  Created by Yusuke Mori on 2017/12/25.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class LoadingTimelineViewController: UIViewController {
    init()
    {
        super.init(nibName: nil, bundle: nil)
        self.title = "Loading by pull up."
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
