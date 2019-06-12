//
//  ViewController.swift
//  Filters
//
//  Created by Jayaram G on 12/06/19.
//  Copyright © 2019 Jayaram G. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    
    struct Filter {
        let filterName:String
        var filterEffectValue: Any?
        var filterEfffectValueName:	String?
        
        init(filterName: String , filterEffectValue: Any? , filterEffectValueName: String?) {
            self.filterName = filterName
            self.filterEffectValue = filterEffectValue
            self.filterEfffectValueName = filterEffectValueName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    private func applyFilterTo(image: UIImage , filterEffect: Filter) -> UIImage? {
        
       // guard let cgImage = image.cgImage,
//            let openGLContext =  EAGLRenderingAPI.openGLES3 else {return nil}
      //  let context = CIContext(
        return image
    }
    
    @IBAction func selectImageAction(_ sender: UIButton) {
        editProfileButtonTap()
    }
    
    
    func editProfileButtonTap() {
        let alert = UIAlertController(title: nil, message:nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (action) in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { (action) in
            self.openGallery()
        }))
alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePickerObj = UIImagePickerController()
            imagePickerObj.delegate = self
            imagePickerObj.sourceType = UIImagePickerController.SourceType.camera;
            imagePickerObj.allowsEditing = false
            self.present(imagePickerObj, animated: true, completion: nil)
        } else {
//            self.showAlert("Alert".localized, message: "Your device doesn't support Camera. Please choose other option.".localized)
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePickerObj = UIImagePickerController()
            imagePickerObj.delegate = self
            imagePickerObj.sourceType = UIImagePickerController.SourceType.photoLibrary;
            imagePickerObj.allowsEditing = false
            self.present(imagePickerObj, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageViewOutlet.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
      
    }
    }
