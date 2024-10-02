//
//  DetailViewController.swift
//  HalalFoodFinder
//
//  Created by Saad Hussain on 3/14/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var addrL: UILabel!
    @IBOutlet weak var tagL: UITextView!
    var currentRestaurant : Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var tagLst = ""
//        for tag in currentRestaurant.categories. {
//            tagLst += tag
//        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        titleL.text = currentRestaurant?.name
        addrL.text = currentRestaurant?.location?.formatted_address
        var tagLst = "Restaurant Tags:\n"
        if let categories = currentRestaurant?.categories{
            for tag in categories {
                tagLst += tag.name + "\n"
            }
            tagL.text = tagLst
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
