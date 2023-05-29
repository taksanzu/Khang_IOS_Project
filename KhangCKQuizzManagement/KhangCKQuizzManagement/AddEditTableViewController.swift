//
//  AddEditTableViewController.swift
//  KhangCKQuizzManagement
//
//  Created by BVU on 5/29/23.
//

import UIKit

class AddEditTableViewController: UITableViewController {

    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var showQuestionBtn: UIButton!
    var topic: Topic?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topic = topic {
            symbolTextField.text = topic.symbol
            nameTextField.text = topic.name
            title = "Edit Topic"
        } else {
            title = "Add Topic"
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        updateSaveButtonState()
        
        
    }
    init?(coder: NSCoder, topic: Topic?) {
        self.topic = topic
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSaveButtonState() {
        let nameText = nameTextField.text ?? ""
        saveBarButton.isEnabled = containsSingleTopic(symbolTextField) && !nameText.isEmpty
    }
    @IBAction func editTextChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    func containsSingleTopic(_ textField: UITextField) -> Bool {
        guard let text = textField.text, text.count == 1 else {
            return false
        }
        let isCombinedIntoEmoji = text.unicodeScalars.count > 1 &&
           text.unicodeScalars.first?.properties.isEmoji ?? false
        let isEmojiPresentation = text.unicodeScalars.first?.properties.isEmojiPresentation ?? false
        return isEmojiPresentation || isCombinedIntoEmoji
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        let symbol = symbolTextField.text!
        let name = nameTextField.text ?? ""
        topic = Topic(symbol: symbol, name: name)
        
    }
    
}
