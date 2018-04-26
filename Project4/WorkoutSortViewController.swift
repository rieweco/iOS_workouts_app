//
//  ViewController.swift
//  Project4
//
//  Created by cody riewerts on 7/24/17.
//  Copyright © 2017 umsl. All rights reserved.
//

import UIKit

protocol WorkoutSortDelegate: class {
    func sortOptionChanged(method: WorkoutSortOption)
}


class WorkoutSortViewController: UIViewController {
    
    weak var delegate: WorkoutSortDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func dateAscendingSortButton(_ sender: UIButton) {
        delegate?.sortOptionChanged(method: .dateAscendingSort)
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func dateDescendingSortButton(_ sender: UIButton) {
        delegate?.sortOptionChanged(method: .dateDescendingSort)
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func caloriesBurnedSortButton(_ sender: UIButton) {
        delegate?.sortOptionChanged(method: .caloriesBurnedSort)
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func durationSortButton(_ sender: UIButton) {
        delegate?.sortOptionChanged(method: .durationSort)
        let _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
