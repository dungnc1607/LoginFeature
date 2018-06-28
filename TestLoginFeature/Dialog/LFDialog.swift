//
//  LFDialog.swift
//  TestLoginFeature
//
//  Created by Squall on 6/28/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class LFDialog: LFBaseDialog {

    @IBOutlet weak var mainDialog: UIView!
    @IBOutlet weak var titleAlert: UILabel!
    
    var onClickOK:(()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainContentView = mainDialog
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func actionOk(_ sender: Any) {
        self.dismiss()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.onClickOK?()
        }
    }
    
}
