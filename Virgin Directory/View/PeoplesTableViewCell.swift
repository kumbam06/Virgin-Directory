//
//  PeoplesTableViewCell.swift
//  Virgin Directory
//
//  Created by pradeep reddy kumbam on 14/08/22.
//

import UIKit

class PeoplesTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeImgView: UIImageView!
    
    @IBOutlet weak var employeenameLbl: UILabel!
    @IBOutlet weak var employeeDesignationLbl: UILabel!
    @IBOutlet weak var employeeEmailLbl: UILabel!
    @IBOutlet weak var employeeFavColorLbl: UILabel!
    
    var downloadedimg = UIImage()
//    static func nib() -> UINib {
//        return UINib(nibName: DirectoryConstants.peopleTableViewCellIdentifier, bundle: nil)
//    }
    
    public func configure(with imageURL: String, name: String, designation: String, email: String, color: String){
        
        fetchImage(imageString: imageURL)
        
        employeeImgView.image = downloadedimg
        employeenameLbl.text = name
        employeeDesignationLbl.text = "Designation : \(designation)"
        employeeEmailLbl.text = "Email : \(email)"
        employeeFavColorLbl.text = "Favourite Color : \(color)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func fetchImage(imageString: String) {
        
        guard let url = URL(string: imageString) else {
            return
        }
        
        let getDataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.downloadedimg = image
                }
            }
        }
        getDataTask.resume()
    }
}
