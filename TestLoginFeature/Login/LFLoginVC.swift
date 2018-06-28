//
//  LFLoginVC.swift
//  TestLoginFeature
//
//  Created by Squall on 6/25/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import UIKit
import SVProgressHUD

class LFLoginVC: LFBaseViewController {
	
	var username:String?
	var password:String?
	var showNavigatioBar:Bool = true
	var originNavViewColor:UIColor?
	@IBOutlet weak var textFieldUsername: UITextField!
	@IBOutlet weak var textFieldPassword: UITextField!
	
	@IBOutlet weak var btnSignIn: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		btnSignIn.layer.cornerRadius = 25
		edgesForExtendedLayout = []
		originNavViewColor = navigationController?.view.backgroundColor
		setupNavigationBar()
		
		navigationController?.isNavigationBarHidden = true
	}
	
	@IBAction func getEmail(_ sender: UITextField) {
		username = sender.text!
	}
	
	@IBAction func getPassword(_ sender: UITextField) {
		password = sender.text!
	}
	
	@IBAction func actionPressForgotPassword(_ sender: Any) {
		print("Press Forgot Password")
	}
	
	@IBAction func actionPressSignUp(_ sender: Any) {
		print("Press Sign Up")
	}
	
	@IBAction func actionPressSignIn(_ sender: Any) {
		SVProgressHUD.show()
		username = textFieldUsername.text
		password = textFieldPassword.text
		print("Information: ", username! + ", " + password!)
		
		self.LoginWithEmail(email: self.username, password: self.password, completion: { (data) in
			if data["token"] != nil{
				let vc:LFUserInfoVC = LFUserInfoVC(nibName: LFUserInfoVC.typeName, bundle: Bundle.main)
				vc.userInformation = data["user"] as? [String : Any]
				self.navigationController?.pushViewController(vc, animated: true)
				SVProgressHUD.dismiss()
            }else{
                LFUtility.showAlertController(message: "Emai or password is wrong!", completion: {
                    
                })
            }
		})
		
	}
	
	func LoginWithEmail(email:String?, password:String?, completion:@escaping ([String:Any]) -> Void){
		let params:[String:Any] = [
			LFApiKey.username: username ?? "",
			LFApiKey.password: password ?? ""
		]
		
		LFApiManager.sharedInstance.postLoginWithEmail(params: params)  { (data) in
			completion(data)
		}
	}
	
	func setupNavigationBar(){
		navigationController?.setNavigationBarHidden(!showNavigatioBar, animated: false)
		navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
		navigationController?.navigationBar.shadowImage = nil
		navigationController?.view.backgroundColor = originNavViewColor
		navigationController?.navigationBar.isTranslucent = false
	}
	
}
