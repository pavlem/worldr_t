# worldr_t


First checkout the project and start the **worldr_t.xcodeproj** file, there are no third party dependencies, so it’s pretty simple. In case you want to build on a real device, add your bundle ID project settings. 

# User Interface:
* Just build the app and you will see the data fetched from the local json file inside a collection view (this is simulation of the API call)
* You can scroll this collection vertically like it was a classical table view. For the case where there is an image url, you will see the image on the left and the text on the right. Image first has a placeholder, but then a real one is being downloaded
* You can tap on any cell and the details screen will open. If there is an image, it will also appear, while if there is no image, only text will be shown. 
* All the downloaded images are cached so there is no double downloading. 

# Architecture:
* MMVM-C is used as an app design pattern since it complements Apple's native, out of the box, MVC for UIKit and it's new MVVM in SwiftUI. Coordinator pattern is used to handle the flow for example from the main collection view list to the details screen
* Unit tests are made for view models and moc JSON of products list and details, they are just examples and many more tests can be done
* Reusable components have been made (like InfoImageView) for illustration purposes. 
* File organisation: 
    * App - App related data 
     *Models
    * Views
    * ViewControllers
    * ViewModels
    * Lib - all custom made libraries 
    * Resources - storyboards, strings, images


