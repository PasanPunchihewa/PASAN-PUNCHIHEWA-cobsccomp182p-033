//
//  AddEventViewController.swift
//  PASAN-PUNCHIHEWA-cobsccomp182p-033
//
//  Created by JOHN DOE on /1/320.
//  Copyright © 2020 PASAN. All rights reserved.
//
import Foundation
import UIKit
import FirebaseDatabase



class AddEventViewController: UIViewController {
    @IBOutlet weak var EventInfotxt: UITextView!
    
    
    
    @IBAction func AddEventBtn(_ sender: Any) {
    }
    @IBAction func cancelBtn(_ sender: Any) {
    }
    
    @IBAction func EventNameTxt(_ sender: Any) {
    }
    
    @IBAction func EventSummerytxt(_ sender: Any) {
    }
    
    @IBAction func EventLocationTxt(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddEvent(_ sender: Any) {
        
       presentingViewController?.dismiss(animated: true, completion: nil)
        
//        if (txtFirstName.text == "") {
//            alert.showAlert(title: "Event", message: "First Name Required:",buttonText: "Add Missing Event")
//            return
//        }
//
//        if (txtLastName.text == ""){
//            alert.showAlert(title: "Event", message: "Lasr Name Required:",buttonText: "Add Missing Event")
//            return
//        }
//        if (txtContact.text == ""){
//            alert.showAlert(title: "Event", message: "Contact Required:",buttonText: "Add Missing Event")
//            return
//        }
//        if (txtDepartment.text == ""){
//            alert.showAlert(title: "Event", message: "Department Required:",buttonText: "Add Missing Event")
//            return
//        }
    }
    
    @IBAction func CancelEventClicked(_ sender: Any) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
     override func viewDidLoad() {
     super.viewDidLoad()
     styleElements()
     imagePicker = UIImagePickerController()
     imagePicker.allowsEditing = true
     imagePicker.sourceType = .photoLibrary
     imagePicker.delegate = self
     
     self.ref = Database.database().reference()
     imgPicture.isUserInteractionEnabled = true
     
     // Do any additional setup after loading the view.
     }
     
     func styleElements(){
     
     // Utility.btnButtonStylesRed(btnAddimg)
     //   Utility.btnButtonStyles(btnUploadEvent)
     Utility.txtTextFieldStyles(txtEventTitle)
     Utility.txtTextFieldStyles(txtEventDiscription)
     Utility.txtTextFieldStyles(txtLocation)
     Utility.txtTextFieldStyles(txtSummary)
     
     }
     
     @IBAction func btnLocation(_ sender: UIButton) {
     let latitude:CLLocationDegrees = 6.906731
     let longitude:CLLocationDegrees = 79.870616
     
     let regionDistance:CLLocationDistance = 1000;
     let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
     let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
     
     let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
     
     let placemark = MKPlacemark(coordinate: coordinates)
     let mapItem = MKMapItem(placemark: placemark)
     mapItem.name = "My House"
     mapItem.openInMaps(launchOptions: options)
     
     
     }
     
     /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
     @IBAction func btnAddimage(_ sender: UIButton) {
     self.present(imagePicker, animated: true, completion: nil)
     
     }
     
     @IBAction func btnUploadEvent(_ sender: UIButton) {
     
     let alert = AlertFunction()
     if (txtEventTitle.text == "") {
     alert.showAlert(title: "Event", message: "Title is required:",buttonText: "Add Missing Event")
     return
     }
     
     
     if (txtLocation.text == ""){
     alert.showAlert(title: "Event", message: "Event Location is required:",buttonText: "Add Missing Event")
     return
     }
     if (imgPicture.image == nil){
     alert.showAlert(title: "Event", message: "Event Image is required:",buttonText: "Add Missing Event")
     return
     }
     if (txtSummary.text == ""){
     alert.showAlert(title: "Event", message: "Event Summery is required:",buttonText: "Add Missing Event")
     return
     }
     if (txtEventDiscription.text == ""){
     alert.showAlert(title: "Event", message: "Event Discription is Required:",buttonText: "Add Missing Event")
     return
     }
     
     self.saveFIRData()
     //navigationController?.popViewController(animated: true)
     
     alert.showAlert(title: "Event", message: "Event Added Successfully", buttonText: "Event Home")
     
     let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "UiTabBarHomeViewController") as!UiTabBarHomeViewController
     
     let navController = UINavigationController(rootViewController: VC1)
     
     self.present(navController, animated:true, completion: nil)
     
     
     }
     func saveFIRData(){
     self.uploadMedia(image: imgPicture.image!){ url in
     self.saveImage(profileImageURL: url!){ success in
     if (success != nil){
     self.dismiss(animated: true, completion: nil)
     }
     
     }
     }
     }
     
     func uploadMedia(image :UIImage, completion: @escaping ((_ url: URL?) -> ())) {
     let imageName = UUID().uuidString
     let storageRef = Storage.storage().reference().child("events").child(imageName)
     let imgData = self.imgPicture.image?.pngData()
     let metaData = StorageMetadata()
     metaData.contentType = "image/png"
     storageRef.putData(imgData!, metadata: metaData) { (metadata, error) in
     if error == nil{
     storageRef.downloadURL(completion: { (url, error) in
     completion(url)
     })
     }else{
     print("error in save image")
     completion(nil)
     }
     }
     }
     
     func saveImage(profileImageURL: URL , completion: @escaping ((_ url: URL?) -> ())){
     //let alert = AlertFunction()
     let dict = ["description": txtEventDiscription.text!, "imageUrl": profileImageURL.absoluteString,"event_title": txtEventTitle.text!,"summery": txtSummary.text!,"location": txtLocation.text!] as [String : Any]
     self.ref.child("events").childByAutoId().setValue(dict)
     //alert.showAlert(title: "Event", message: "Event Added Successfully", buttonText: "Event Home")
     
     /* let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "UiTabBarHomeViewController") as!UiTabBarHomeViewController
     
     let navController = UINavigationController(rootViewController: VC1)
     
     self.present(navController, animated:true, completion: nil)*/
     }
     
     
     }
     extension UiTabCreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
     picker.dismiss(animated: true, completion: nil)
     }
     
     internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
     if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
     self.imgPicture.image = pickedImage
     }
     
     picker.dismiss(animated: true, completion: nil)
     }
    */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
