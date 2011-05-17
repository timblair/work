require 'work/version'
require 'work/teacher'
require 'work/dotfile'

module Work

  DEFAULT_DOMAINS = %w{
    arstechnica.com boingboing.net cnet.com codinghorror.com crunchgear.com
    daringfireball.net digg.com en.wikipedia.org engadget.com engadgetmobile.com
    facebook.com feedly.com gawker.com gigaom.com gizmodo.com guardian.co.uk
    hacker-newspaper.gilesb.com icombinator.net kottke.org lifehacker.com
    macnn.com macrumors.com mashable.com metafilter.com news.google.com
    news.ycombinator.com nytimes.com radar.oreilly.com readwriteweb.com
    reddit.com techcrunch.com techmeme.com torrentfreak.com tuaw.com
    tweetmeme.com venturebeat.com wired.com youtube.com zdnet.com zenhabits.net
  }

  class HostsFileNotWritable < StandardError; end
  class DotFileNotWritable < StandardError; end

end
