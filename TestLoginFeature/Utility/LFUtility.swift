//
//  LFUtility.swift
//  TestLoginFeature
//
//  Created by Squall on 6/25/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation
import SVProgressHUD
class LFUtility: NSObject {
    
    class func showAlertController(message:String, completion: (() -> Void)?) {
       // let vc: LFDialog = LFDialog(nibName: LFDialog.typeName, bundle: Bundle.main)
        let vc:LFDialog = LFDialog(nibName: LFDialog.typeName, bundle: Bundle.main)
        vc.onClickOK = {
            completion?()
        }
        vc.showDialog(completion: nil)
        vc.titleAlert.text = message
    }
    
}
