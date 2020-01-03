#!/usr/bin/env ruby

def ls(path)
	files = []
	dir = Dir.new(path)
	while file = dir.read
		files << "#{dir.path}/#{file}" unless file =~ /^\.{1,2}$/
	end
	files
end


asm = /
	# Mnemonic
	\b moveq (\.l)? \s+
	
	# Address
	\#( \$ -? [0-9a-f]{1,3}
	  |    %  [0-1]{1,8}
	  |    -? [0-9]{1,3}
	  )
	, \s*
	
	# Register
	d[0-7] \b
	
	| ^ \s* move     (\.[bwl])? \s+ (sr|usp), \s* [^\s]+
	| ^ \s* movem     \.[bwl]  \b
	| ^ \s* move[mp] (\.[wl])? \b
	| ^ \s* btst  \b
	| ^ \s* dbra  \b
/xim;


files = ls "./files"

files.each do |file|
	begin
		data = File.read file
		if data =~ asm
			puts "Motorola ASM: #{file}"
		else
			puts "Not Motorola: #{file}"
		end
	rescue ArgumentError => error
		warn "Failed reading #{file}"
		pp error
		exit 1
	end
end
