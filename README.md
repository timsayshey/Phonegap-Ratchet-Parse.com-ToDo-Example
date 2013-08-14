# Phonegap Ratchet Parse.com ToDo Example

I have combined all of these components plus more to create a lightweight demo app that runs buttery smooth on Android 4+ and iOS.

## [Here's the demo](http://outerplex.com/Phonegap-Ratchet-Parse.com-ToDo-Example "Did I mention it's awesome!")

## Installation

### Up and running

Just download and extract the code to a folder. Then open the index.html file in a webkit compatible browser (chrome).

I would recommend that you change the Parse app key and rest key with your own. To do this edit /assets/jsvendor/jquery.parse.js lines 5 and 6.

Coldfusion (CFML) is only required to compile the index.html file. Of course you could use this without it but it would be very difficult IMO.

### Compiling with CFML (quick n easy)

Just download the free opensource easy installer at (http://getrailo.org/download/) (available for any OS). 

Then run the installer and copy the project files into {folder you installed it to}/tomcat/webapps/ROOT/. 

Then open up your browser and go to http://localhost:[port you chose]/www/index.cfm to view and test. 

To compile just navigate to http://localhost:[port you chose]/generate.cfm and click the generate button.

## What technologies and why

### Why Ratchet?

Well, I needed a lightweight CSS library so Ratchet was a perfect fit. I only use the Ratchet CSS, not the Ratchet JS.

### Why iScroll?

Because phonegap dosen't natively give you scrollbars which makes for a bad user experience so I added iScroll.

### Why Parse.com?

Its FREE and its pretty sweet. Perfect restful backend for my app that required almost no setup and just works. So why not?

### Why Phonegap? 

Well, this is all meant for phonegap but you could use it with Trigger.io or just post it straight to the interwebs but thats up to you.

### Why CFML?

Mainly to keep the code more organized and easier to read and manage. Instead of writing up all the code in one huge HTML file, it is written out in separate files then compiled with CFML in to one HTML file. One of the great features of CFML is that the language is so easy to learn. At times, it's almost like an extension of HTML. Plus, since it runs on Java, you have access to all of the power of Java.

### This is opensource

I am posting this work in an effort to help improve and evolve this code and to give back to the community. *So please contribute all day every day :)*

### Documentation

I wish I had time to better comment the code, I will probably do this if demand grows or if someone else wants to take this on, feel free :)

### Contribute

I'm an expert at a few things, and a hack at most. Feel free to make changes and issue a pull request.
