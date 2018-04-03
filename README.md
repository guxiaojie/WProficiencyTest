
# iOS Proficiency Exercise

Xcode 9.2, iOS 8

BBQMan(App Name) displays photos with headings and descriptions..

## Architecture

- `ViewController.swift`:  Use TableView(CollectionView is also great),

- `PhotoTableViewCell.swift`:  Cell with Photos/headings/descriptions

- `PhotoRequest.swift`: Request Data from  service; parse with SwiftyJSON

- `Canada.swift`: A model according to REST service

- `Photo.swift`: Another model according to REST service


## Request
Use URLSessionDataTask instead of  NSURLConnection

```objective-c
class func downloadData(completion: @escaping (_ blog: Canada?,  _ error: Error?) -> Void ) {}
```

## Pod
Pod Parse JSON and  download Image

```objective-c
pod 'SwiftyJSON'
pod 'Kingfisher', '~> 4.0'
```

## Unit Tests
includes a suite of unit tests within the Tests subdirectory. These tests can be run simply be executed the test action on the platform framework you would like to test.
- `BBQManTests.swift`





