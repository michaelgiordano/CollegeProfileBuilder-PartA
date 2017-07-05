
//
//  DetailViewController.swift
//  App 5 - College Profile Builder
//
//  Created by Michael Giordano on 7/3/17.
//  Copyright © 2017 Michael Giordano. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var websiteTextField: UITextField!
    
    let realm = try! Realm()
    let imagePicker = UIImagePickerController()
    
    var detailItem: College?
    {
        didSet
        {
            // Update the view.
            configureView()
        }
    }
    
    @IBAction func onTappedSaveButton(_ sender: Any)
    {
        if let college = self.detailItem
        {
            try! realm.write({
                college.name = collegeTextField.text!
                college.location = locationTextField.text!
                college.enrollment = Int(enrollmentTextField.text!)!
                college.image = UIImagePNGRepresentation(imageView.image!)!
                college.website = websiteTextField.text!
            })
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    func configureView()
    {
        //Update the user interface for the detail item
        if let college = self.detailItem
        {
            if collegeTextField != nil
            {
                collegeTextField.text = college.name
                locationTextField.text = college.location
                enrollmentTextField.text = String(college.enrollment)
                imageView.image = UIImage(data: college.image)
                websiteTextField.text = college.website
            }
        }
    }
    
    @IBAction func openInSafariWithGoButton(_ sender: Any)
    {
        if let college = self.detailItem {
            if let url = URL(string: college.website)
            {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    @IBAction func onLibraryButtonTapped(_ sender: Any)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let dvc = segue.destination as! MapViewController
        dvc.location = collegeTextField.text!
    }
}

