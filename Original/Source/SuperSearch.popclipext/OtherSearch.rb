#!/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/bin/ruby

require 'cgi'

searchlist=[ "baidu.com", "so.com", "sogou.com", "bing.com", "yahoo.com", "duckduckgo.com"]
urllist=[ "https://www.baidu.com/s?wd={query}", "https://www.so.com/s?q={query}", "https://www.sogou.com/web?query={query}", "http://www.bing.com/search?q={query}", "https://search.yahoo.com/search?p={query}", "https://duckduckgo.com/?q={query}"]

search = ENV['POPCLIP_OPTION_OTHERSITE']
customsearch = ENV['POPCLIP_OPTION_CUSTOMSEARCH']
query = ENV['POPCLIP_TEXT']

url = String.new(customsearch)

i = 0
for s in searchlist
   if search == s then
   	  url = urllist[i]
      break
   end
   i = i + 1
end

url.sub!(/\{query\}/,CGI.escape(query))

%x{open "#{url}"}
