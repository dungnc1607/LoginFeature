//
//  LFApiManager.swift
//  TestLoginFeature
//
//  Created by Squall on 6/25/18.
//  Copyright © 2018 Squall. All rights reserved.
//

import Foundation
import Alamofire

class LFApiManager{
    static var sharedInstance:LFApiManager = LFApiManager()
    var host:String = "http://dev.tapid.co.uk:2727/api/auth/signin"
	
    func post(params:[String:Any], completion: @escaping(Error?, Data?) -> Void) {
		Alamofire.request(host, method: .post, parameters: params, encoding: URLEncoding.default, headers: createFormUrlEncoded()).response { response in
			completion(response.error,response.data)
		}
    }
    
    func createFormUrlEncoded()-> HTTPHeaders{
        return [
            "Content-Type":"application/x-www-form-urlencoded",
            "Squall": "using in the future"
        ]
    }
    
    func postLoginWithEmail(params:[String:Any], completion: @escaping([String:Any]) -> Void){
        post(params: params){ (error, data) in
            if error != nil{
                completion([String:Any]())
            }else{
                let stringJson = String(data: data!, encoding: .utf8)
                let dict = self.convertToDictionary(text: stringJson!)
                completion(dict ?? [String : Any]())
            }
        }
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}
