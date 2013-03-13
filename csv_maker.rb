
File::open( 'me.csv', 'w' ) do |file|
  for i in 1..5 do
    file << "CF#{i},#{i}\n"
  end
end

