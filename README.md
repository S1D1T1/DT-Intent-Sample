# DT-Intent-Sample

A quick prototype illustrating a potential set of AppIntents ("shortcuts") for Draw Things

This App publishes a set of sample entry points, visible to MacOS Shortcuts:
- Generate image from prompt, arguments: Prompt (String), Negative Prompt (Optional - String)
- Generate image from json, argument: json(String)
- Run Script by name, argument: script name(String) - an existing script in DT's Scripts folder
- Execute Javascript, argument: javascript content(String)
- Get Image Folder Path: no argument - returns String containing path to DT's saved image folder, if selected

The app contains interfaces to these sample commands, but doesn't implement them of course. 
Running the app displays commands and their arguments, as they are issued from the Shortcuts app. 

**Sample Display of App** 

<img width="545" alt="Screenshot 2024-04-22 at 10 27 36 AM" src="https://github.com/S1D1T1/DT-Intent-Sample/assets/156350598/d2463c05-e1d6-4432-b416-ac77f68e898a">

**App commands appearing in Shortcuts App**

<img width="426" alt="Screenshot 2024-04-22 at 10 26 25 AM" src="https://github.com/S1D1T1/DT-Intent-Sample/assets/156350598/ac45557c-ef16-4961-a87f-3431c93c8005">
