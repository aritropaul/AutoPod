# AutoPod
Easier Cocoa Pods installation

### How to install
Clone this repo

`$ git clone https://github.com/notACoder69/AutoPod.git`
 
 cd into the directory
 
 `$ cd AutoPod`

Run setup

`$ sh setup.sh`


### How to use

  * Make a project in Xcode, as usual.
  
  * Write whatever pods you need in the ViewController files.
  
  * cd into the project directory
  
  *  `$ autopod`  

##### Magic
###### PRs are very much needed, and welcome :)

### Create native library exceptions
add native library names to the exception list

    `$ notapod Name`
    
This will make sure autopod doesn't search and download native libraries

### Sync your autopod repo with your mac

`cd AutoPod`
`$ podsync`


### Uninstall

`$ unpod`


### To-do
 - [x] fix directory issues
 - [ ] pod groups
 - [ ] contributing.md
 - [ ] paramters and help
