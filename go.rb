#!/usr/bin/env ruby

require "fileutils"

META_FILES = %w(go.rb README.md gitconfig.sample init.lua)

Dir.chdir File.dirname(__FILE__) do
  puts "Symlinking..."

  Dir.glob("*").each do |file|
    unless META_FILES.include?(file)
      puts "Symlinking #{file} to #{File.dirname(__FILE__)}/#{file}"

      FileUtils.ln_s(File.expand_path(File.join(File.dirname(__FILE__), file)), "#{ENV["HOME"]}/.#{file}", :force => true)
    end
  end

  puts "Symlinking init.lua to #{ENV["HOME"]}/.config/nvim/init.lua"
  FileUtils.ln_s(File.expand_path(File.join(File.dirname(__FILE__), 'init.lua')), "#{ENV["HOME"]}/.config/nvim/init.lua")

  %x[curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim]
end
