//
//  APISearch.swift
//  HalalFoodFinder
//
//  Created by Saad Hussain on 3/14/24.
//

import Foundation

func getRes(lat: String, lon: String, completion: @escaping ([Restaurant]?) -> ())  {
    
    let headers = [
        "accept": "application/json",
        "Authorization": "fsq3Mby3eI1l0K3mRwY/PrISu5xLtESx94XHP7Y+Su1j9nI="
    ]
    
    let query = "https://api.foursquare.com/v3/places/search?ll=\(lat)%2C\(lon)&radius=16000&categories=13191"
    
    let request = NSMutableURLRequest(url: NSURL(string: query)! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
      if (error != nil) {
        print(error as Any)
      } 
    else {
//        let httpResponse = response as? HTTPURLResponse
        let decoder = JSONDecoder()
        do {
            //temp to help debug here
            let temp = try decoder.decode(RestList.self, from: data!)
            completion(temp.results)
            debugPrint("DONE")
            
        }
        catch{
            print("Error in JSON Parsing")
        }
          
      }
    })

    dataTask.resume()
    /*
    let request = NSMutableURLRequest(url: NSURL(string: query)! as URL,
                                       cachePolicy: .useProtocolCachePolicy,
                                       timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
        if let error = error {
            print("Error: \(error)")
        } else {
            if let data = data, let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    // Store response data as its original type (Data)
                    // You can process or use this data as needed
                    print("Response Data: \(data)")
                    debugPrint(type(of: data))
                    
                    // Example: processResponseData(data)
                } else {
                    print("HTTP Error: \(httpResponse.statusCode)")
                }
            } else {
                print("No data received or response is not HTTPURLResponse")
            }
        }
    }

    dataTask.resume()
    */
}

