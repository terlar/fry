function suite_fry-help
	function test_exit_status
		assert (fry-help)
	end

	function test_output
		refute_empty (fry-help)
	end
end

source (dirname (status -f))/helper.fish
