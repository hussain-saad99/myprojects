//
//  ViewController.swift
//  HalalFoodFinder
//
//  Created by Saad Hussain on 3/11/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    
    var isLoading: Bool = false
    

    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var stateText: UITextField!
    
    @IBOutlet weak var zipText: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var settingsButton: UIButton!
    let states = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    var searchString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
//    @IBAction func prepare(for segue: UIStoryboardSegue, _ sender: UIButton) {
//        let msg = "Please either fill in the Zip Code field or the City and State fields"
//        let alertController = UIAlertController(title: "Invalid Input", message: msg, preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        
//       //Check for valid input conditions
//        
//        //Put in zipcode and left city/state blank
//        if (!zipText.text!.isEmpty && cityText.text!.isEmpty && stateText.text!.isEmpty){
//            searchString = zipText.text!
//            promptAPI(with: searchString, segue: segue)
//            
//        }
//        //left zipcode blank and put in city/state
//        else if (zipText.text!.isEmpty && !cityText.text!.isEmpty && !stateText.text!.isEmpty) {
//            let temp = cityText.text! + ", " + stateText.text!
//            searchString = cityToZip2[temp]!
//            promptAPI(with: searchString, segue: segue)
////            performSegue(withIdentifier: "searchtoRes", sender: self)
//        }
//        // the rest are invalid inputs
//        else {
//            present(alertController, animated: true, completion: nil)
//        }
//    }
    
    func promptAPI(with zip: String) {
        
        convertZipcode(zipcode: zip) { location, error in
            if let location {
                getRes(lat: "\(location.latitude)", lon: "\(location.longitude)") { restaraunts in
                    print("Restraunts: \(restaraunts?.first?.name ?? "nope")")
                    
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RestaurantListTableViewController") as? RestaurantListTableViewController
                    
                    //check for flags in restaurants
                    if flags.isEmpty{
                        vc?.restrauntList = restaraunts!
                    }
                    //check for flags in restaurants
                    else {
                        var updatedList: [Restaurant]? = []
                        
                        for flag in flags {
                            for r in restaraunts! {
                                var found = false
                                for tag in r.categories! {
                                    if tag.name.contains(flag){
                                        found = true
                                    }
                                }
                                if found {
                                    updatedList!.append(r)
                                }
                            }
                        }
                        
                        vc?.restrauntList = updatedList
                    }
                    
                    
                    if let vc {
                        DispatchQueue.main.async {
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: true)

                        }
                    }
//                    self.navigationController?.pushViewController(vc!, animated: true)
//                    performSegue(withIdentifier: "searchtoRes", sender: self)
//                    if let viewController = segue.destination as? RestaurantListTableViewController {
//                        viewController.restrauntList = restaraunts
//                    }
                }
            }
        }
        
//        getRes(lat: parsed![0], lon: parsed![1]) { restraunts in
//            if let viewController = segue.destination as? RestaurantListTableViewController {
//                viewController.restrauntList = restraunts
//            }
            
//
//        }

    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        let msg = "Please either fill in the Zip Code field or the City and State fields"
        let alertController = UIAlertController(title: "Invalid Input", message: msg, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
       //Check for valid input conditions
        
        //Put in zipcode and left city/state blank
        if (!zipText.text!.isEmpty && cityText.text!.isEmpty && stateText.text!.isEmpty){
            searchString = zipText.text!
            promptAPI(with: searchString)
            
        }
        //left zipcode blank and put in city/state
        else if (zipText.text!.isEmpty && !cityText.text!.isEmpty && !stateText.text!.isEmpty) {
            let temp = cityText.text! + ", " + stateText.text!
            searchString = cityToZip2[temp]!
            promptAPI(with: searchString)
//            performSegue(withIdentifier: "searchtoRes", sender: self)
        }
        // the rest are invalid inputs
        else {
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func convertZipcode(zipcode: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
        let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(zipcode) { (placemarks, error) in
                if let error = error {
                    print("Geocode failed with error: \(error.localizedDescription)")
                    completion(nil, error)
                    return
                }
                
                if let placemark = placemarks?.first {
                    let coordinate = placemark.location?.coordinate
                    completion(coordinate, nil)
                } else {
                    print("No coordinates found for this ZIP code.")
                    completion(nil, nil)
                }
            }
    }

    @IBAction func tapBackground(_ sender: UIControl) {
        cityText.resignFirstResponder()
        stateText.resignFirstResponder()
        zipText.resignFirstResponder()
    }
}

