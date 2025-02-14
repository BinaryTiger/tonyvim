return {
  {
    prefix = 'fread',
    body = [[
ARGF.each_line do |line|
  $0
end
    ]],
    desc = 'read file lines from stdin'
  },
}
