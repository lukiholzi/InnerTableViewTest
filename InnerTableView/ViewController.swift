//
//  ViewController.swift
//  InnerTableView
//
//  Created by Ziga Vehovec on 16.03.22.
//

import UIKit

protocol Data {}

struct TextData : Data {
  let text: String
}

struct InnerTableViewData : Data {
  let items: [String]
}

class TextCell : UITableViewCell {
  public static let identifier = "TextCell"
  @IBOutlet var label: UILabel!
}

class InnerTableViewCell : UITableViewCell, UITableViewDataSource, UITableViewDelegate {
  public static let identifier = "InnerTableViewCell"
  @IBOutlet var tableView: UITableView!
  @IBOutlet var tableViewHeight: NSLayoutConstraint!
  
  var data: [String]! {
    didSet {
      tableView.isScrollEnabled = false
      tableView.dataSource = self
      tableView.delegate = self
      tableView.reloadData()
      tableView.layoutIfNeeded()
      
      tableViewHeight.constant = tableView.contentSize.height
      print("Size: \(tableView.contentSize)")
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = data[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: InnetTableViewItemCell.identifier) as! InnetTableViewItemCell
    cell.button.setTitle(item, for: .normal)
    return cell
  }
}

class InnetTableViewItemCell : UITableViewCell {
  public static let identifier = "InnetTableViewItemCell"
  @IBOutlet weak var button: UIButton!
}

class ViewController: UIViewController {
  
  @IBOutlet var tableView: UITableView!
  
  private var data: [Data] = [
    InnerTableViewData(items: ["First button", "Second button", "Third button", "Fourth button", "Fifth button", "Sixth button"]),
    TextData(text: "Hello yo"),
    TextData(text: "Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline"),
    TextData(text: "Hello yo"),
    TextData(text: "Hello yo"),
    TextData(text: "Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline"),
    TextData(text: "Hello yo"),
    TextData(text: "Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline"),
    TextData(text: "Hello yo"),
    TextData(text: "Hello yo"),
    TextData(text: "Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline"),
    TextData(text: "Hello yo"),
    TextData(text: "Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline"),
    TextData(text: "Hello yo"),
    TextData(text: "Hello yo"),
    TextData(text: "Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline Multiline")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = data[indexPath.row]
    switch item {
    case is TextData:
      let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.identifier) as! TextCell
      cell.label.text = (item as! TextData).text
      return cell
    case is InnerTableViewData:
      let cell = tableView.dequeueReusableCell(withIdentifier: InnerTableViewCell.identifier) as! InnerTableViewCell
      cell.data = (item as! InnerTableViewData).items
      return cell
    default:
      fatalError("Unknown shit")
    }
  }
}


class InnerTableView: UITableView {
/*
  override var intrinsicContentSize: CGSize {
    self.layoutIfNeeded()
    return self.contentSize
  }

  override var contentSize: CGSize {
    didSet {
      self.invalidateIntrinsicContentSize()
      layoutSubviews()
    }
  }

  override func reloadData() {
    super.reloadData()
    self.invalidateIntrinsicContentSize()
  }
 */
}
