

import UIKit

class WorkoutListViewController: UIViewController {

    @IBOutlet weak fileprivate var tableView: UITableView!
    
    
 
    
    fileprivate var model: WorkoutListModelInterface = WorkoutListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 64
        self.view.backgroundColor = UIColor.gray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WorkoutCreationViewController {
            destination.delegate = self
        }
        else if let destination = segue.destination as? WorkoutSortViewController {
            destination.delegate = self
        }
    }




}

extension WorkoutListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell",
                                                     for: indexPath) as? WorkoutListTableViewCell,
            let workout = model.workout(atIndex: indexPath.row)
        else { return UITableViewCell() }
        
        cell.decorate(with: workout)
        
        return cell
    }

}

extension WorkoutListViewController: WorkoutSortDelegate {
    func sortOptionChanged(method: WorkoutSortOption) {
        model.sort(with: method)
    }
}


extension WorkoutListViewController: WorkoutCreationViewControllerDelegate {
    func save(workout: Workout) {
        model.save(workout: workout)
    }
}

extension WorkoutListViewController: WorkoutListModelDelegate {
    func dataRefreshed() {
        tableView.reloadData()
    }
}
