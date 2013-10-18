# Phonegap Ratchet Parse.com ToDo Example

I have combined all of these components plus more to create a lightweight demo app that runs buttery smooth on Android 4+ and iOS.

## [Here's the demo](http://outerplex.com/Phonegap-Ratchet-Parse.com-ToDo-Example "Did I mention it's awesome!")

## Installation

### Up and running

Just download and extract the code to a folder. Then open the index.html file in a webkit compatible browser (chrome).

I would recommend that you change the Parse app key and rest key with your own. To do this edit /assets/jsvendor/jquery.parse.js lines 5 and 6.

Railo is only required to compile the index.html file. Of course you could use this without it but it would be very difficult IMO.

### Compiling with Railo (quick n easy)

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

### Why Railo?

Mainly to keep the code more organized and easier to read and manage. Instead of writing up all the code in one huge HTML file, it is written out in separate files then compiled with Railo in to one HTML file. One of the great features of Railo is that the language is so easy to learn. At times, it's almost like an extension of javascript. Plus, since it is a Java framework, you have access to all of the power of Java.

### This is opensource

I am posting this work in an effort to help improve and evolve this code and to give back to the community. *So please contribute all day every day :)*

### Documentation

I wish I had time to better comment the code, I will probably do this if demand grows or if someone else wants to take this on, feel free :)

### Contribute

I'm an expert at a few things, and a hack at most. Feel free to make changes and issue a pull request.

## LICENSE

>**The MIT License (MIT)**
>
>Copyright (c) 2012 Tim Badolato and Contributors
>
>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
>
>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

**What does that mean?**

It means you can use this pretty much any way you like. You can fork it. You can include it in a proprietary product, sell it, and not give us a dime. Pretty much the only thing you can't do is hold us accountable if anything goes wrong.
