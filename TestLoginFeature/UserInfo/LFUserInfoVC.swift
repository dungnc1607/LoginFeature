//
//  LFUserInfoVC.swift
//  TestLoginFeature
//
//  Created by Squall on 6/26/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit

class LFUserInfoVC: LFBaseViewController {

    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelLastName: UILabel!
    @IBOutlet weak var labelFirstName: UILabel!
    @IBOutlet weak var labelStudentNumber: UILabel!
    @IBOutlet weak var labelLibraryNumber: UILabel!
    var userInformation:[String:Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupData()
    }
    
    func SetupData(){
        labelLastName.text = (userInformation!["last_name"] as! String)
        labelUserName.text = (userInformation!["username"] as! String)
		labelFirstName.text = (userInformation!["first_name"] as! String)
        labelStudentNumber.text = (userInformation?["student_number"] as! String)
        labelLibraryNumber.text = (userInformation?["library_number"] as! String)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
}
