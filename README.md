![Placid.app iOS SDK](https://user-images.githubusercontent.com/4189032/155142345-cf18994f-d66e-46cc-8261-39732b0a53fb.gif)

<div align="center">

  <h1>Placid iOS SDK</h1>
  <strong>Generate custom share images on-device</strong>
  <br /><br />

<p align="center">
  <a href="https://cocoapods.org/pods/placid"><img src="https://img.shields.io/cocoapods/v/placid.svg" /></a>
  <a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" /></a>
  <a href="https://www.swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-compatible-green" /></a>
  <a href="#"><img src="https://img.shields.io/badge/iOS-13%2B-lightblue" /></a>
  <a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-5.3-orange.svg" /></a>
</p>

</div>

[Placid](https://placid.app) is a toolkit for creative automation. It lets you generate images with dynamic content from custom templates - e.g. for personalized share visuals. The Placid iOS SDK offers native, on-device image generation for your apps.

* Offline, on-device image generation
* Custom templates for on-brand visuals
* Drag & drop template editor
* Dynamic content layers
* Auto-resizing for text and images
* Unlimited generated images
* Dynamic in-app previews

➡️ [Learn more about the Placid Mobile SDK](http://placid.app/solutions/mobile-sdk)

---

## ⚙️ Requirements

- iOS 13.0

## 📦️  Installation

### Swift Package Manager

To integrate the Placid SDK into your Xcode project using [Swift Package Manager](https://swift.org/package-manager/), specify it in the `dependencies` of your `Package.swift`:

```swift
// swift-tools-version:5.3
import PackageDescription
...
dependencies: [
    .package(url: "https://github.com/placidapp/placid-ios.git", .upToNextMajor(from: "0.0.9"))
]
...
```

:warning: The SDK has dependencies on binary frameworks, so you have to use a version higher than 5.3 of your Swift Tools 

### CocoaPods

To integrate Placid into your Xcode project using [CocoaPods](https://cocoapods.org), specify it in your `Podfile`:

```ruby
pod 'Placid'
```

### Carthage

To integrate Placid into your Xcode project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```ogdl
binary "https://raw.githubusercontent.com/placidapp/placid-ios/master/Placid.json"
```

### Manually

If you prefer to integrate Placid manually instead of using a Dependency Manager, [download the latest Placid.xcframwork](https://github.com/placid/ios-sdk/releases/latest/download/Placid.xcframework.zip) and add it to your project. 

## ✨ Usage

### Setup on placid.app

1. Register on [placid.app](https://placid.app) (✅ free trial)
2. Create a project and add the Placid mobile integration
3. Add a template
4. Add a mobile license in your project settings
5. Download your template(s) to use with the SDK

### Configuration

Configure the Placid SDK in your `AppDelegate` by providing the URL to your mobile templates package downloaded from the Placid web app.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    do {
	    var debug = false    
	    #if DEBUG
	    debug = true
	    #endif
        
        try PlacidSDK.configure(withLicenseKey: "your-placid-license-key", templateURL: Bundle.main.url(forResource: "templates", withExtension: "placid"), debug: false)
    } catch {
        print(error.localizedDescription)
    }
}
```

### Retrieve Templates

Templates can be retrieved via their unique identifier (as found in the [Placid web app](https://placid.app)). If the template is not found, this method will return nil.

```swift
let template = PlacidSDK.template(withIdentifier: "template-identifier")
```

### Preload Templates

For faster rendering it is recommended to preload a template as soon as it is accessed.

```swift
template.preload()
```

### Modify Layer Data

You can modify the content and appearance of dynamic layers in your template.

:warning: Use the layer names as specified in the template editor, otherwise the layer will be ignored.

#### Text

```swift
let textLayer = template.textLayer(named: "title")
textLayer.text = "A new title"
textLayer.textColor = UIColor.red
```

#### Images

```swift
let image = UIImage(named: "avatar")!
let imageLayer = template.imageLayer(named: "img-title")
imageLayer.image = image
```

#### Rectangles

```swift
let rectangleLayer = template.rectangleLayer(named: "rect")
rectangleLayer.backgroundColor = UIColor.red
rectangleLayer.borderColor = UIColor.blue
```

#### Browser Frames

```swift
let browserFrameLayer = template.browserFrameLayer(named: "browser")
browserFrameLayer.url = browserURL
```

#### General Properties

These properties are supported by all layer types.

```swift
let layer = template.textLayer(named: "title")
layer.isHidden = false
layer.origin = .zero
layer.size = CGSize(width: 100, height: 50)
```

The mobile SDK supports the same layers and properties as the [Placid REST API](https://placid.app/docs/2.0/rest/layers), so have a look for the full set of supported functions and properties.

### Render Images
Once all data is added to the template, it can be rendered to a native image. Use the rendered image in your `UIImageView`s for dynamic in-app previews or pass it along for social sharing.

```swift
template.render(completion: { [weak self] image in
	// use the image here
})
```

Or via *async* function:

```swift
let image = await template.render()
```

## 💬 Support

For bug reports, please create a new Issue right here on Github. Otherwise have a look at our [Help section](https://placid.app/help).
