//
//  TopicTableViewController.swift
//  KhangCKQuizzManagement
//
//  Created by BVU on 5/29/23.
//

import UIKit

class TopicTableViewController: UITableViewController {
    var topics: [Topic] = [
        Topic(symbol: "🐱", name: "Động vật"),
        Topic(symbol: "📕", name: "Văn học"),
        Topic(symbol: "⛰", name: "Địa lý"),
        Topic(symbol: "🧑‍💻", name: "Tin học"),
        Topic(symbol: "👅", name: "Hài hước")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @IBSegueAction func addEditTopic(_ coder: NSCoder, sender: Any?) -> AddEditTableViewController? {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            // Editing Emoji
            let topicToEdit = topics[indexPath.row]
            return AddEditTableViewController(coder: coder,
               topic: topicToEdit)
        } else {
            // Adding Emoji
            return AddEditTableViewController(coder: coder,
               topic: nil)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier:
           "TopicCell", for: indexPath) as! TopicTableViewCell
        //Step 2: Fetch model object to display
        let topic = topics[indexPath.row]
        //Step 3: Configure cell
        cell.update(with: topic)
        cell.showsReorderControl = true
        //Step 4: Return cell
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let topic = topics[indexPath.row]
            print("\(topic.symbol) \(indexPath)")
    }
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
            tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedTopic = topics.remove(at: fromIndexPath.row)
            topics.insert(movedTopic, at: to.row)
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                topics.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: . automatic)
        }
    }
    @IBAction func unwindToTopicTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
        let sourceViewController = segue.source
                   as? AddEditTableViewController,
        let topic = sourceViewController.topic else { return }
        print(topic)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            topics[selectedIndexPath.row] = topic
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: topics.count, section: 0)
            topics.append(topic)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: "tak", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "haveTopic" {
                if let addEditViewController = segue.destination as? AddEditTableViewController {
                    addEditViewController.showQuestionBtn.isHidden = false
                }
            }
    }
}
