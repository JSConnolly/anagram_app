get '/' do
  if params[:term]
    redirect to("/#{params[:term]}"), 301
  else
    erb :index
  end
end

post '/check_term' do
  @anagrams = []
  @term = params[:term]


  terms = Term.where("canonical = ?", @term.split("").sort.join(""))
  p terms
  terms.each do |term|
    @anagrams << term.name unless term.name == @term
  end
  @anagrams.uniq!
  @anagrams.join(" ")
end

# Sinatra's get, post, put, etc. URL helpers match against the shape/form of a URL.
# That is,
#
#   get '/:word' do
#     ...
#   end
#
# means "call this block any time we see a URL that looks like /<word>"
#
# The parts of a URL are separated by a /, so these match '/:word'
#
#   /foo, /bar, /apple+pie, /four+score+and+seven+years+ago
#
# whereas these do not match '/:word'
#
#   /, /word1/word2, /this/is/a/long/url, /articles/123
#
# This will bind whatever fits in the :word spot in the URL
# to params[:word], "as if" it were passed in via a query string
# like ?word=apples
