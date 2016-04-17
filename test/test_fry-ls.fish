function suite_fry-ls
	function setup
		stub_var fry_rubies (stub_dir)
		mkdir -p $fry_rubies/ruby-2.0/bin
	end

	function test_exit_status
		assert (fry-ls)
	end

	function test_output
		assert_includes system (fry-ls)
		assert_includes ruby-2.0 (fry-ls)
	end
end

source (dirname (status -f))/helper.fish
