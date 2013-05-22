# BaconStash ToDo Demo App

Taste the bacon.

## CFML + Ratchet + iScroll + Parse.com + Phonegap = Sweet delicious bacon

I have combined all of these components plus more to create a lightweight application (framework?) that runs as smooth as butter on Android 4+ and iOS. Right now I'll admit, its not the most organized code, I am learning best practices for javascript BUT it works so if you are thinking "Hey this code looks like it was written by a monkey on crack" and you think you can improve it, then *PLEASE CONTRIBUTE* or raise an issue :{D

### Why Ratchet?

Well, I needed a lightweight CSS library so Ratchet was a perfect fit. I only use the Ratchet CSS, not the Ratchet JS.

### Why iScroll?

Because phonegap dosen't natively give you scrollbars which makes for a bad user experience so I added iScroll.

### Why Parse.com?

Its FREE and its pretty sweet. Perfect restful backend for my app that required almost no setup and just works. So why not?

### Why Phonegap? 

Well, this is all meant for phonegap but you could use it with Trigger.io or just post it straight to the interwebs but thats up to you.

### Why CFML?

Mainly to keep the code more organized and easier to read and manage and stuff. Instead of writing up all the code in one huge HTML file, it is written out in separate files then compiled with CFML in to one HTML file and BOOM.

### This is opensource

I am posting this work in an effort to help improve and evolve this code and to give back to the community. *So please contribute all day every day :)*

### Documentation

I wish I had time to better comment the code, I will probably due this if demand grows or if someone else wants to take this on, feel free :)

### Installation

Just download and extract the code to a folder. Then open the index.html file.

I would recommend that you change the Parse app key and rest key with your own. To do this edit /assets/jsvendor/jquery.parse.js lines 5 and 6.

Coldfusion is only required to compile the index.html file. Of course you could use this without it but it would be very difficult IMO.

