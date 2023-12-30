//
//  ViewController.swift
//  NewsApp2
//
//  Created by Ahmet Yavaş on 29.12.2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model : [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getData()
    }
    
func getData ()
    {
        WebServices.shared.fetchData { model in
            
            if let model = model
            {
                DispatchQueue.main.sync {
                    self.model = model
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource
{
    
  
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let item = model[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTableView

            cell.newsTitle.text = item.title
            cell.newsDescription.text = item.description
            cell.newImageView.sd_setImage(with: URL(string: item.urlToImage ?? "nil"))
            
            return cell
        }
    
}
