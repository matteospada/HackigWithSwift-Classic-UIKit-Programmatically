//
//  ViewController.swift
//  Project13
//
//  Created by Matteo Spada on 25/05/22.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let frame = UIView()
    let imageView = UIImageView()
    let slider = UISlider()
    let intensity = UILabel()
    let filter = UIButton()
    let save = UIButton()
    var currentImage: UIImage!
    
    var context: CIContext!
    var currentFilter: CIFilter!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "YACIFP"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
        setup()
        
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        currentImage = image
        dismiss(animated: true)
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
        
    }
    
    
    func setup() {
        
        title = "Edit"
        frame.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        intensity.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        save.translatesAutoresizingMaskIntoConstraints = false
        
        
        frame.backgroundColor = .gray
        view.addSubview(frame)
        frame.addSubview(imageView)
        
        
        //frame.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        
        print(frame.intrinsicContentSize.height)
        print(frame.intrinsicContentSize.width)
        
        view.addSubview(intensity)
        intensity.text = "Intensity"
        
        
        
        
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.isContinuous = true
        slider.value = 5
        slider.tintColor = UIColor.blue
        slider.addTarget(self, action: #selector(intensityChanged(_:)), for: .valueChanged)
        view.addSubview(slider)
        
        
        var config = UIButton.Configuration.plain()
        config.title = "Filter"
        filter.configuration = config
        view.addSubview(filter)
        filter.addTarget(self, action: #selector(changeFilter(_:)), for: .primaryActionTriggered)
        
        
        var config2 = UIButton.Configuration.plain()
        config2.title = "Save"
        save.configuration = config2
        save.addTarget(self, action: #selector(save(_:)), for: .primaryActionTriggered)
        view.addSubview(save)
        
        
        
        
        
        
        
        
        //Frame
        NSLayoutConstraint.activate([
            frame.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            frame.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            frame.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            //frame.heightAnchor.constraint(equalToConstant: 470)
            frame.bottomAnchor.constraint(equalTo: intensity.topAnchor, constant: -20)
        ])
        
        //IMAGE
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: frame.topAnchor, constant: 10),
            
            imageView.leadingAnchor.constraint(equalTo: frame.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: frame.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: frame.bottomAnchor, constant: -10),
        ])
        
        //LABEL
        NSLayoutConstraint.activate([
            intensity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            intensity.bottomAnchor.constraint(equalTo: save.topAnchor, constant: -20)
            
            
            
        ])
        
        //Slider
        
        NSLayoutConstraint.activate([
            slider.leadingAnchor.constraint(equalTo: intensity.trailingAnchor, constant: 20),
            
            slider.centerYAnchor.constraint(equalTo: intensity.centerYAnchor),
            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
        
        //FILTER BUTTON
        NSLayoutConstraint.activate([
            filter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            
            filter.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
        ])
        
        
        
        //SAVE BUTTON
        NSLayoutConstraint.activate([
            save.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            save.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    //MARK: ACTIONS
    
    
    @objc func intensityChanged(_ sender: UISlider!) {
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(slider.value, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(slider.value * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(slider.value * 10, forKey: kCIInputScaleKey) }
        if inputKeys.contains(kCIInputCenterKey) { currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2), forKey: kCIInputCenterKey) }
        
        if let cgimg = context.createCGImage(currentFilter.outputImage!, from: currentFilter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            self.imageView.image = processedImage
        }
    }
    
    @objc func changeFilter(_ sender: Any) {
        let ac = UIAlertController(title: "Choose filter", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    @objc func save(_ sender: UIButton!){
        guard let image = imageView.image else { return }

        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    
    func setFilter(action: UIAlertAction) {
        // make sure we have a valid image before continuing!
        guard currentImage != nil else { return }
        
        // safely read the alert action's title
        guard let actionTitle = action.title else { return }
        
        currentFilter = CIFilter(name: actionTitle)
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        applyProcessing()
    }
    
    
    
    
    
}

