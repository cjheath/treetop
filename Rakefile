require 'rspec/core/rake_task'

desc 'Generate website files'
task :website_generate do
  system 'cd doc; ruby ../bin/site.rb'
end

desc 'Upload website files'
task :website_upload do
  # The website is now done using gh-pages
  system <<-END
    git checkout gh-pages
    cp website/*.html .
    git add *.html
    git commit -m"Website update `date`"
    git push
    git checkout master
  END
end

desc 'Generate and upload website files'
task :website => [:website_generate, :website_upload]
