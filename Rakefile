require 'rspec/core/rake_task'

desc 'Generate website files'
task :website do
  system 'cd doc; ruby ../bin/site.rb'
end

desc 'Upload website files'
task :upload do
  # The website is now done using gh-pages
  system <<-END
    git add *.html
    git add --update .
    git commit -m"Website update `date`"
    git push
  END
end
