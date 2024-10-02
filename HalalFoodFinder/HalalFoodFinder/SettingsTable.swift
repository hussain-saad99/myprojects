//
//  SettingsTable.swift
//  HalalFoodFinder
//
//  Created by Saad Hussain on 3/13/24.
//

import UIKit

class SettingsTable: UITableViewController {

    @IBOutlet weak var homeB: UIButton!
    
    @IBOutlet weak var burgerB: UISwitch!
    @IBOutlet weak var indianB: UISwitch!
    @IBOutlet weak var arabB: UISwitch!
    @IBOutlet weak var medB: UISwitch!
    @IBOutlet weak var pakistaniB: UISwitch!
    
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        burgerB.isOn = false
        indianB.isOn = false
        arabB.isOn = false
        medB.isOn = false
        pakistaniB.isOn = false
        setupSwitches()
        
    }
    func setupSwitches() {
            // Check if switch states have been previously set
            let burgerSwitchState = userDefaults.bool(forKey: "burgerSwitchState")
            let indianSwitchState = userDefaults.bool(forKey: "indianSwitchState")
            let arabSwitchState = userDefaults.bool(forKey: "arabSwitchState")
            let medSwitchState = userDefaults.bool(forKey: "medSwitchState")
            let pakiSwitchState = userDefaults.bool(forKey: "pakiSwitchState")
            
            // Set switches to default "off" state if they haven't been previously set
            burgerB.isOn = burgerSwitchState
            indianB.isOn = indianSwitchState
            arabB.isOn = arabSwitchState
            medB.isOn = medSwitchState
            pakistaniB.isOn = pakiSwitchState
            
            // If switch states haven't been previously set, set them to "off" in UserDefaults
            if !userDefaults.bool(forKey: "switchesInitialized") {
                userDefaults.set(false, forKey: "burgerSwitchState")
                userDefaults.set(false, forKey: "indianSwitchState")
                userDefaults.set(false, forKey: "arabSwitchState")
                userDefaults.set(false, forKey: "medSwitchState")
                userDefaults.set(false, forKey: "pakiSwitchState")
                userDefaults.set(true, forKey: "switchesInitialized")
            }
    }
    
    
    @IBAction func dimisstoHome(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func burgerTap(_ sender: UISwitch) {
        if sender.isOn {
            if !flags.contains("Burger"){
                flags.append("Burger")
            }
            userDefaults.set(true, forKey: "burgerSwitchState")
        }
        else {
            flags = flags.filter{$0 != "Burger" }
            userDefaults.set(false, forKey: "burgerSwitchState")
        }
        
    }
    
    @IBAction func indianTap(_ sender: UISwitch) {
        if sender.isOn {
            if !flags.contains("Indian"){
                flags.append("Indian")
            }
            userDefaults.set(true, forKey: "indianSwitchState")
        }
        else {
            flags = flags.filter{$0 != "Indian" }
            userDefaults.set(false, forKey: "indianSwitchState")
        }
    }
    
    @IBAction func arabTap(_ sender: UISwitch) {
        if sender.isOn {
            if !flags.contains("Arab"){
                flags.append("Arab")
            }
            userDefaults.set(true, forKey: "arabSwitchState")
        }
        else {
            flags = flags.filter{$0 != "Arab" }
            userDefaults.set(false, forKey: "arabSwitchState")
        }
    }
    
    @IBAction func medTap(_ sender: UISwitch) {
        if sender.isOn {
            if !flags.contains("Mediterranean"){
                flags.append("Mediterranean")
            }
            userDefaults.set(true, forKey: "medSwitchState")
        }
        else {
            flags = flags.filter{$0 != "Mediterranean" }
            userDefaults.set(false, forKey: "medSwitchState")
        }
    }
    
    @IBAction func pakiTap(_ sender: UISwitch) {
        if sender.isOn {
            if !flags.contains("Pakistani"){
                flags.append("Pakistani")
            }
            userDefaults.set(true, forKey: "pakiSwitchState")
        }
        else {
            flags = flags.filter{$0 != "Pakistani" }
            userDefaults.set(false, forKey: "pakiSwitchState")
        }
    }
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
    /*
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
