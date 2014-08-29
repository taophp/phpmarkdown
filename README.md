phpmarkdown
===========

An extension to php wrapping Discountcpp which is a wrapper for Discount, a C markdown lib

## Dependencies

You'll have to install some stuff before you can install phpmarkdown :

* [PHP-CPP](http://www.php-cpp.com/): a C++ library that helps you to write PHP extension
* [Discount](http://www.pell.portland.or.us/~orc/Code/discount/): a C library to translate Markdown to Html (and more...)
* [Discountcpp](https://github.com/SuperV1234/DiscountCpp): a C++ wrapper for Discount

Of course, you may need some dev tools like CMake, G++ or php5-dev pakage.

### Installing PHP-CPP

	$ git clone https://github.com/CopernicaMarketingSoftware/PHP-CPP.git
	$ cd PHP-CPP
	$ make
	$ sudo make install

### Installing Discount

	$ wget http://www.pell.portland.or.us/~orc/Code/discount/discount-2.1.6.tar.bz2
	$ bunzip discount-2.1.6.tar.bz2
	$ tar xf dicount-2.1.6.tar
	$ cd discount-2.1.6
	$ ./configure.sh --shared
	$ make
	$ sudo make install

### Installing Discountcpp

	$ git clone https://github.com/SuperV1234/DiscountCpp.git
	$ cd DiscountCpp

**!! WARNING !!** Here you must edit the file CmakeLists.txt and change the line :

	add_library(HEADER_ONLY_TARGET STATIC ${SRC_LIST})

to

	add_library(HEADER_ONLY_TARGET SHARED ${SRC_LIST})

so now you can go on :

	$ cmake CMakeLists.txt
	$ make
	$ sudo make install

## Installation

	$ git clone https://github.com/taophp/phpmarkdown.git
	$ cd phpmarkdown
	$ make
	$ sudo make installgit clone https://github.com/taophp/phpmarkdown.git

## Test

Now, the command :

	$ php -m |grep markdown

should output :

	markdown

## Usage

This extensin adds four functions to PHP :

* `getHTMLFromMarkdownString(string mdstring)`: translate mdstring from markdown to HTML and return it
* `getHTMLFromMarkdownFile(string mdfile)`: translate the content of mdfile from markdown to HTML and return it
* `writeHTMLFileFromMarkdownString(string htmlfile, string mdstring)`: translate mdstring from markdown to HTML and write it in htmlfile, return void
* `writeHTMLFileFromMarkdownFile(string htmlfile, string mdfile)`: translate the content of mdfile from markdown to HTML and write it in htmlfile, return void

## Example

	print getHTMLFromMarkdownString("#Test\n\n##Test2\n\n")."\n";

