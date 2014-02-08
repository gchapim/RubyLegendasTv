RubyLegendasTv
==============

An API for [LegendasTv](http://legendas.tv/)'s 2013 Website.

Install:
<pre><code>gem install ruby_legendas_tv</code></pre>

in your code:

<pre><code>require 'ruby_legendas_tv'</code></pre>

## How to use

### Searching

#### Searching for a Movie or Show by name:

<pre><code>#A movie (you can do the same for a Tv Show):
irb(main):004:0> titles = RubyLegendasTv.search_title('The Secret Life of Walter Mitty')
=> [#Title:0x0000000119f928 @name="A Vida Secreta de Walter Mitty", @description="The Secret Life of Walter Mitty", @image_url="/img/poster/214x317/legendas_tv_20131213184132.jpg", @id="31506", @link="/util/carrega_legendas_busca/id_filme:31506"]</code></pre>

now you can get the subtitles using the Title:

<pre><code>irb(main):005:0> subtitles = RubyLegendasTv.search_subtitles_from_title(titles[0])</code></pre>

#### Searching for a subtitle directly (i.e. with a release):

<pre>code>irb(main):006:0> subtitles = RubyLegendasTv.search_subtitles('Arrested Development S04E01 SaM-qrus')

#download link
irb(main):007:0> subtitles[0].download_link
=> "/downloadarquivo/52811bfae781c"</code></pre>


---------------------------------------

### Getting subtitles from Homepage

You can also get the most downloaded subtitles list from "Mais Baixados da Semana" section:

<pre><code>irb(main):008:0> subtitles = RubyLegendasTv.get_most_downloaded_subtitles</code></pre>

or from Highlights (pt: Destaques) list:

<pre><code>irb(main):009:0> subtitles = RubyLegendasTv.get_highlights</code></pre>

## Known Issues

* You can't get the language of the subtitle without searching with a query (or title)
* Uploader info doesn't work yet
* Likes and Unlikes attributes always return nil.

## License

(The MIT License)

Copyright © 2014 - [Gustavo Chapim](https://github.com/gchapim/)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
